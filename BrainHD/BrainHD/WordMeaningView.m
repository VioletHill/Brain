//
//  WordMeaningView.m
//  Brain
//
//  Created by 邱峰 on 13-12-18.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import "WordMeaningView.h"
#import "NSAttributedString+Html2Attributed.h"
#import "WordManager.h"
#import "UIColor+AppColor.h"

@interface WordMeaningView ()

@property (nonatomic, strong) UILabel* wordTitle;
@property (nonatomic, strong) UIView* cutOff;
@property (nonatomic, strong) UITextView* meaningView;
@property (nonatomic, strong) NSString* selectString;
@property (nonatomic, strong) NSAttributedString* oldAttributed;
@property (nonatomic, strong) NSDictionary* hint;

@end

@implementation WordMeaningView {
    NSRange selectRange;
    NSRange lastRange;
}

#pragma mark - getter & setter

- (UIView*)cutOff
{
    if (_cutOff == nil) {
        _cutOff = [[UIView alloc] init];
        _cutOff.backgroundColor = [UIColor cutOffColor];
    }
    return _cutOff;
}

- (UILabel*)wordTitle
{
    if (_wordTitle == nil) {
        _wordTitle = [[UILabel alloc] init];
        _wordTitle.font = [UIFont systemFontOfSize:22];
        _wordTitle.textColor = [UIColor titleLableColor];
        _wordTitle.backgroundColor = [UIColor meaningViewBackgroundColor];
    }
    return _wordTitle;
}

- (UITextView*)meaningView
{
    if (_meaningView == nil) {
        _meaningView = [[UITextView alloc] init];
        _meaningView.backgroundColor = [UIColor meaningViewBackgroundColor];
        _meaningView.editable = NO;
        _meaningView.scrollEnabled = NO;
        _meaningView.contentSize = CGSizeMake(0, 0);
    }
    return _meaningView;
}

#pragma mark - init

- (instancetype)initWithWidth:(CGFloat)width
{
    if (self = [super initWithFrame:CGRectMake(0, 0, width, 0)]) {
    }
    return self;
}

- (void)setWord:(NSString*)word andMeaning:(NSString*)meaning
{
    self.backgroundColor = [UIColor meaningViewBackgroundColor];
    self.wordTitle.text = word;
    self.meaningView.attributedText = [NSAttributedString getAttributeStringFromHtmlString:meaning];
    self.oldAttributed = self.meaningView.attributedText;
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
    [self setupLayout];
}

#pragma mark - layout

- (void)setupLayout
{
    [self addSubview:self.meaningView];
    [self addSubview:self.cutOff];
    [self addSubview:self.wordTitle];

    CGSize size = [self.meaningView sizeThatFits:CGSizeMake(self.frame.size.width - 20, FLT_MAX)];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, size.height + 44 + 2);

    self.meaningView.translatesAutoresizingMaskIntoConstraints = NO;
    self.cutOff.translatesAutoresizingMaskIntoConstraints = NO;
    self.wordTitle.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary* dictionaryView = NSDictionaryOfVariableBindings(_cutOff, _wordTitle, _meaningView);
    NSArray* wordTitleHLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_wordTitle]-10-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:dictionaryView];
    NSArray* cutoffHLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_cutOff]-10-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:dictionaryView];
    NSArray* meaningViewHLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_meaningView]-10-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:dictionaryView];
    NSArray* vLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_wordTitle(44)]-0-[_cutOff(2)]-0-[_meaningView]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:dictionaryView];

    [self addConstraints:wordTitleHLayout];
    [self addConstraints:cutoffHLayout];
    [self addConstraints:meaningViewHLayout];
    [self addConstraints:vLayout];
    [self setNeedsLayout];
}

- (NSString*)getStringAtIndex:(NSInteger)index
{
    NSMutableString* result = [[NSMutableString alloc] init];
    NSString* str = self.meaningView.attributedText.string;
    int l = (int)index;
    int r = (int)index;
    @try {
        UIFont* font = [[self.meaningView.attributedText attributesAtIndex:index effectiveRange:nil] objectForKey:@"NSFont"];

        if ([font.description rangeOfString:@"font-weight: bold"].location == NSNotFound) {
            selectRange = NSMakeRange(0, 0);
            return result;
        }
    }
    @catch (NSException* exception)
    {
        return result;
    }

    @try {
        NSInteger next = index;
        while (next < str.length) {
            UIFont* nextFont = [[self.meaningView.attributedText attributesAtIndex:next effectiveRange:nil] objectForKey:@"NSFont"];
            if ([nextFont.description rangeOfString:@"font-weight: bold"].location != NSNotFound) {
                [result appendFormat:@"%c", [str characterAtIndex:next]];
                r = (int)next;
                next++;
            } else
                break;
        }
    }
    @catch (NSException* exception)
    {
    }

    @try {
        NSInteger last = index - 1;

        while (last >= 0) {
            UIFont* lastFont = [[self.meaningView.attributedText attributesAtIndex:last effectiveRange:nil] objectForKey:@"NSFont"];
            if ([lastFont.description rangeOfString:@"font-weight: bold"].location != NSNotFound) {
                [result insertString:[NSString stringWithFormat:@"%c", [str characterAtIndex:last]] atIndex:0];
                l = (int)last;
                last--;
            } else
                break;
        }
    }
    @catch (NSException* exception)
    {
    }

    @try {
        selectRange = NSMakeRange(l, r - l + 1);
    }
    @catch (NSException* exception)
    {
        selectRange = NSMakeRange(l, 0);
    }
    return result;
}

- (NSDictionary*)hint
{
    if (_hint == nil) {
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Hint" ofType:@"plist"];
        _hint = [NSDictionary dictionaryWithContentsOfFile:filePath];
    }
    return _hint;
}

- (BOOL)isHintWord:(NSString*)touchWord
{
    NSDictionary* item = [self.hint objectForKey:self.word];
    if (item) {
        NSString* filePath = nil;
        if ((filePath = [item objectForKey:touchWord]) != nil) {
            return YES;
        } else
            return NO;
    }
    return NO;
}

#pragma mark - word touch

- (void)wordTap:(CGPoint)pos
{
    if (lastRange.location != selectRange.location && lastRange.length != selectRange.length) {
        self.meaningView.attributedText = self.oldAttributed;
    }

    pos.y += self.meaningView.contentOffset.y;
    UITextPosition* tapPos = [self.meaningView closestPositionToPoint:pos];
    NSInteger tapIndex = [self.meaningView offsetFromPosition:self.meaningView.beginningOfDocument toPosition:tapPos] - 1;
    self.selectString = [self getStringAtIndex:tapIndex];

    if (([[WordManager sharedWordManager] findWordByCompleteWord:self.selectString] || [self isHintWord:self.selectString]) && selectRange.length != 0) //点击阴影效果
    {
        lastRange = NSMakeRange(selectRange.location, selectRange.length);
        NSMutableAttributedString* att = [self.oldAttributed mutableCopy];
        [att addAttribute:NSBackgroundColorAttributeName value:[UIColor lightGrayColor] range:selectRange];
        self.meaningView.attributedText = att;
    }
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    CGPoint pos = [[touches anyObject] locationInView:self.meaningView];
    [self wordTap:pos];
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
    CGPoint pos = [[touches anyObject] locationInView:self.meaningView];
    [self wordTap:pos];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
    if (lastRange.length != 0) {
        self.meaningView.attributedText = self.oldAttributed;
        lastRange.length = 0;
    }

    if (self.selectString != nil && ![self.selectString isEqualToString:@""] && [self.delegate respondsToSelector:@selector(wordTapCallBack:)]) {
        [self.delegate wordTapCallBack:self.selectString];
    }
}

- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event
{
    [self touchesEnded:touches withEvent:event];
}

@end
