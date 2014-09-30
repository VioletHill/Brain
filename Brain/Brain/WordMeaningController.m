//
//  WordMeaningController.m
//  Brain
//
//  Created by 邱峰 on 13-11-6.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import "WordMeaningController.h"
#import "WordManager.h"
#import "WordMeaningView.h"
#import "WordMeaningRootScrollView.h"
#import "RelatedWordTableView.h"
#import "HintViewController.h"
#import "UIColor+AppColor.h"
#import "MarkWordManager.h"

@interface WordMeaningController () <WordMeaingViewTapProtocol, RelatedWordTableViewProtocol>

@property (strong, nonatomic) WordMeaningRootScrollView* scrollView;

@property (nonatomic) BOOL isNeedPop;

@property (nonatomic, strong) NSDictionary* hint;
@property (strong, nonatomic) UIBarButtonItem* wordListBarButton;

@end

@implementation WordMeaningController {
    BOOL isNeedResetPosition;
}

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor meaningViewBackgroundColor];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:93.0 / 255.0 green:63.0 / 255.0 blue:39.0 / 255.0 alpha:1] forKey:NSForegroundColorAttributeName];
    self.navigationItem.rightBarButtonItem = self.wordListBarButton;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor meaningViewBackgroundColor];
    if (self.isNeedPop) {
        [self.navigationController popViewControllerAnimated:NO];
        return;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self resetWordWithWord:self.word];
}

- (UIBarButtonItem*)wordListBarButton
{
    if (_wordListBarButton == nil) {
        _wordListBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(toggleWordListBarButton:)];
    }
    return _wordListBarButton;
}

- (NSDictionary*)hint
{
    if (_hint == nil) {
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Hint" ofType:@"plist"];
        _hint = [NSDictionary dictionaryWithContentsOfFile:filePath];
    }
    return _hint;
}

- (WordMeaningRootScrollView*)scrollView
{
    if (_scrollView == nil) {
        self.view.backgroundColor = [UIColor colorWithRed:172.0 / 255.0 green:154.0 / 255.0 blue:137.0 / 255.0 alpha:1.0];

        _scrollView = (WordMeaningRootScrollView*)[[UIScrollView alloc] init];
        [self.view addSubview:_scrollView];

        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        NSDictionary* dictionaryView = NSDictionaryOfVariableBindings(_scrollView);
        NSArray* vlayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_scrollView]-0-|" options:0 metrics:nil views:dictionaryView];
        NSArray* hlayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_scrollView]-0-|" options:0 metrics:nil views:dictionaryView];
        [self.view addConstraints:vlayout];
        [self.view addConstraints:hlayout];
    }
    return _scrollView;
}

- (void)clearAllMeaningViews
{
    for (UIView* view in self.scrollView.subviews) {
        [view removeFromSuperview];
    }
}

- (NSArray*)getTheKeyArrayWithWord:(Word*)word
{
    //sort
    NSMutableArray* keyArray = [[NSMutableArray alloc] init];
    for (id obj in word.meaning) {
        [keyArray addObject:obj];
    }
    [keyArray sortUsingComparator:^NSComparisonResult(NSString* a, NSString* b) {
        return [a compare:b];
    }];
    return keyArray;
}

- (void)resetWordWithWord:(Word*)word
{
    self.title = word.word;
    self.wordListBarButton.tintColor = [UIColor markWordColorWithWord:self.word.word];

    [self clearAllMeaningViews];

    NSArray* keyArray = [self getTheKeyArrayWithWord:word];

    //add new subview
    float height = 20;

    CGRect relaViewRect;
    for (id obj in keyArray) {
        WordMeaningView* meaningView = [[WordMeaningView alloc] initWithWidth:self.view.frame.size.width - 20];
        [meaningView setWord:obj andMeaning:word.meaning[obj]];
        meaningView.frame = CGRectMake(10, height, self.view.frame.size.width - 20, meaningView.frame.size.height);
        meaningView.delegate = self;
        meaningView.word = self.word.word;

        [self.scrollView addSubview:meaningView];

        height += meaningView.frame.size.height + 20;
        relaViewRect = meaningView.frame;
        [self.scrollView setNeedsLayout];
    }

    //    add relatedwordTable view
    relaViewRect.origin.y = height;

    RelatedWordTableView* relatedWordTableView = [self getRelaWordViewWithRect:relaViewRect];
    height += relatedWordTableView.frame.size.height + 20;
    [self.scrollView addSubview:relatedWordTableView];

    self.scrollView.contentOffset = CGPointMake(0, 0);
    height = MAX(self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height + 1, height);
    [self.scrollView setContentSize:CGSizeMake(0, height)];
    self.scrollView.scrollEnabled = YES;
    [self.view setNeedsLayout];
}

/**
 *  checked the touch word is need to special jump;
 *  some words hint need to be jump to the html file  it was save to the hint.plist
 *
 *  @param touchWord touchword string
 *
 *  @return yes or no
 */
- (BOOL)isNeedHintWithWord:(NSString*)touchWord
{
    NSDictionary* item = [self.hint objectForKey:self.word.word];
    if (item) {
        NSString* filePath = nil;
        if ((filePath = [item objectForKey:touchWord]) != nil) {
            HintViewController* hintController = [[HintViewController alloc] initWithHtmlFile:filePath];
            [self.navigationController pushViewController:hintController animated:YES];
            return YES;
        } else
            return NO;
    }
    return NO;
}

- (void)wordTapCallBack:(NSString*)word
{
    Word* wordEntity = nil;
    @try {
        if ([self isNeedHintWithWord:word]) {
            isNeedResetPosition = YES;
            return;
        }

        wordEntity = [[WordManager sharedWordManager] findWordByCompleteWord:word];
        if (wordEntity == nil)
            wordEntity = [[WordManager sharedWordManager] findWordByCompleteWord:word.lowercaseString];

        if (wordEntity != nil && [wordEntity.word isEqualToString:self.word.word]) {
            isNeedResetPosition = NO;
            WordMeaningController* nextController = [[WordMeaningController alloc] init];
            nextController.word = wordEntity;
            nextController.isNeedPop = YES;
            [self.navigationController pushViewController:nextController animated:YES];
        } else if (wordEntity != nil && ![wordEntity.word isEqualToString:self.word.word]) {
            isNeedResetPosition = YES;
            WordMeaningController* nextController = [[WordMeaningController alloc] init];
            nextController.word = wordEntity;
            [self.navigationController pushViewController:nextController animated:YES];
        }
    }
    @catch (NSException* exception)
    {
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - related word

- (RelatedWordTableView*)getRelaWordViewWithRect:(CGRect)rect
{
    NSArray* array = self.word.releatedWord;
    if (array == nil || array.count == 0)
        return nil;

    array = [array sortedArrayUsingComparator:^NSComparisonResult(NSString* a, NSString* b) {
        return [a compare:b];
    }];

    RelatedWordTableView* relatedWordTableView = [[RelatedWordTableView alloc] initWithData:array andRect:rect];
    relatedWordTableView.relaDelegate = self;
    return relatedWordTableView;
}

- (void)selectWordAtRelaWordView:(NSString*)wordStr
{
    [self wordTapCallBack:wordStr];
}

#pragma mark - mark to word list

- (IBAction)toggleWordListBarButton:(id)sender
{
    NSLog(@"click mark to word list");
    [[MarkWordManager sharedMarkWordManager] toggleWordList:self.word.word];
    self.wordListBarButton.tintColor = [UIColor markWordColorWithWord:self.word.word];
}

#pragma mark - rotate

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self resetWordWithWord:self.word];
}

@end
