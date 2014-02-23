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

@interface WordMeaningView ()

@property (nonatomic,strong) UILabel* wordTitle;
@property (nonatomic,strong) UIButton* cutOff;
@property (nonatomic,strong) UITextView* meaningView;
@property (nonatomic,strong) NSString* selectString;
@property (nonatomic,strong) NSAttributedString* oldAttributed;
@property (nonatomic,strong) NSDictionary* hint;

@end

@implementation WordMeaningView
{
    NSRange selectRange;
    NSRange lastRange;
}

const float width=300;
const float screenWidth=320;

-(UIButton*) cutOff
{
    if (_cutOff==nil)
    {
        _cutOff=[[UIButton alloc] initWithFrame:CGRectMake(0, 44, width, 6)];
        [_cutOff setBackgroundColor:[UIColor colorWithRed:214.0/255.0 green:207.0/255.0 blue:195.0/255.0 alpha:1]];
        [_cutOff setEnabled:NO];
    }
    return _cutOff;
}


-(UILabel*) wordTitle
{
    if (_wordTitle==nil)
    {
        _wordTitle=[[UILabel alloc] initWithFrame:CGRectMake(5, 0, width-5, 44)];
        _wordTitle.textColor=[UIColor colorWithRed:93.0/255.0 green:63.0/255.0 blue:47.0/255.0 alpha:1];
        [self addSubview:self.wordTitle];
        [self addSubview:self.cutOff];
    }
    return _wordTitle;
}

-(UITextView*) meaningView
{
    if (_meaningView==nil)
    {
        _meaningView=[[UITextView alloc] initWithFrame:CGRectMake(0, 50, width, 300)];
        _meaningView.backgroundColor=[UIColor colorWithRed:251.0/255.0 green:240.0/255.0 blue:217.0/255.0 alpha:1.0];
        _meaningView.editable=NO;
        _meaningView.scrollEnabled=NO;
        _meaningView.userInteractionEnabled=NO;
        [self addSubview:_meaningView];
    }
    return _meaningView;
}

-(instancetype) initWithWord:(NSString *)word andMeaning:(NSString *)meaning
{
    if (self=[super init])
    {
        self.backgroundColor=[UIColor colorWithRed:251.0/255.0 green:240.0/255.0 blue:217.0/255.0 alpha:1.0];
        self.wordTitle.text=word;
        self.meaningView.attributedText=[NSAttributedString getAttributeStringFromHtmlString:meaning];
        self.oldAttributed=self.meaningView.attributedText;
        [self adjustTextViewHeight:meaning];
        self.frame=CGRectMake((screenWidth-width)/2, 0, width, self.wordTitle.frame.size.height+self.cutOff.frame.size.height+self.meaningView.frame.size.height);
        self.layer.cornerRadius=10;
        self.meaningView.layer.cornerRadius=10;
        self.userInteractionEnabled=YES;
    }
    return self;
}

-(void) adjustTextViewHeight:(NSString*)str
{
    UITextView* textView=[[UITextView alloc] init];
    textView.attributedText=[NSAttributedString getAttributeStringFromHtmlString:str];
    CGSize size = [self.meaningView sizeThatFits:CGSizeMake(self.meaningView.frame.size.width, FLT_MAX)];
    self.meaningView.frame=CGRectMake(self.meaningView.frame.origin.x, self.meaningView.frame.origin.y, self.meaningView.frame.size.width,size.height);
}

-(NSString*) getStringAtIndex:(NSInteger)index
{
    NSMutableString* result=[[NSMutableString alloc] init];
    NSString* str=self.meaningView.attributedText.string;
    int l=(int)index;
    int r=(int)index;
    @try
    {
        UIFont* font=[[self.meaningView.attributedText attributesAtIndex:index effectiveRange:nil] objectForKey:@"NSFont"];
    
        if ([font.description rangeOfString:@"font-weight: bold"].location==NSNotFound)
        {
            selectRange=NSMakeRange(0, 0);
            return result;
        }
    }
    @catch (NSException *exception) {
        return result;
    }
    
    @try
    {
        NSInteger next=index;
        while (next<str.length)
        {
            UIFont* nextFont=[[self.meaningView.attributedText attributesAtIndex:next effectiveRange:nil] objectForKey:@"NSFont"];
            if ([nextFont.description rangeOfString:@"font-weight: bold"].location!=NSNotFound)
            {
                [result appendFormat:@"%c",[str characterAtIndex:next]];
                r=(int)next;
                next++;
            }
            else break ;
        }
    }
    @catch (NSException *exception)
    {
    }


    @try
    {
        NSInteger last=index-1;
       
        while (last>=0)
        {
            UIFont* lastFont=[[self.meaningView.attributedText attributesAtIndex:last effectiveRange:nil] objectForKey:@"NSFont"];
            if ([lastFont.description rangeOfString:@"font-weight: bold"].location!=NSNotFound)
            {
                [result insertString:[NSString stringWithFormat:@"%c",[str characterAtIndex:last]] atIndex:0];
                l=(int)last;
                last --;
            }
            else break ;
        }
    }
    @catch (NSException *exception) {
        
    }
    
    @try {
        selectRange=NSMakeRange(l, r-l+1);
    }
    @catch (NSException *exception) {
        selectRange=NSMakeRange(l, 0);
    }
    return result;
}

-(NSDictionary*)hint
{
    if (_hint==nil)
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Hint" ofType:@"plist"];
        _hint= [NSDictionary dictionaryWithContentsOfFile:filePath];
    }
    return _hint;
}

-(BOOL) isHintWord:(NSString*)touchWord
{
    NSDictionary* item=[self.hint objectForKey:self.word];
    if (item)
    {
        NSString* filePath=nil;
        if ((filePath=[item objectForKey:touchWord])!=nil)
        {
            return YES;
        }
        else return NO;
    }
    return NO;

}

-(void) wordTap:(CGPoint)pos
{
    if (lastRange.location!=selectRange.location && lastRange.length!=selectRange.length )
    {
        self.meaningView.attributedText=self.oldAttributed;
    }
    
    pos.y += self.meaningView.contentOffset.y;
    UITextPosition      *tapPos = [self.meaningView closestPositionToPoint:pos];
    NSInteger tapIndex=[self.meaningView offsetFromPosition:self.meaningView.beginningOfDocument toPosition:tapPos]-1;
    self.selectString=[self getStringAtIndex:tapIndex];
    if ( ( [[WordManager sharedWordManager] findWordByCompleteWord:self.selectString] ||  [self isHintWord:self.selectString]) && selectRange.length!=0)        //点击阴影效果
    {
        lastRange=NSMakeRange(selectRange.location, selectRange.length);
        NSMutableAttributedString* att=[self.oldAttributed mutableCopy];
        [att addAttribute:NSBackgroundColorAttributeName  value:[UIColor lightGrayColor] range:selectRange];
        self.meaningView.attributedText=att;
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.superview.userInteractionEnabled=NO;
    CGPoint pos=[[touches anyObject] locationInView:self.meaningView];
    [self wordTap:pos];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pos=[[touches anyObject] locationInView:self.meaningView];
    [self wordTap:pos];
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.superview.userInteractionEnabled=YES;
    if (lastRange.length!=0)
    {
        self.meaningView.attributedText=self.oldAttributed;
        lastRange.length=0;
    }
    
  //  NSLog(@"%@",self.selectString);
    if (self.selectString!=nil && ![self.selectString isEqualToString:@""] && [self.delegate respondsToSelector:@selector(wordTapCallBack:)])
    {
        [self.delegate wordTapCallBack:self.selectString];
    }
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

@end
