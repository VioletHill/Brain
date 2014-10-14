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
#import "UIColor+AppColor.h"
#import "HintViewController.h"
#import "RelatedWordTableView.h"
#import "NSString+sortString.h"
#import "MarkWordManager.h"
#import "UserData.h"

@interface WordMeaningController () <WordMeaingViewTapProtocol, RelatedWordTableViewProtocol>

@property (strong, nonatomic) WordMeaningRootScrollView* scrollView;

@property (nonatomic) BOOL isNeedPop;

@property (nonatomic, strong) NSDictionary* hint;

@property (strong, nonatomic) UIBarButtonItem* wordListBarButton;

@end

static WordMeaningController* instanceWordMeaningController;
static WordMeaningController* rootWordMeaningController;

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
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor titleLableColor] forKey:NSForegroundColorAttributeName];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:BOOKMARKS_CHANGE_AT_LISTVIEW object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetBookmark:) name:BOOKMARKS_CHANGE_AT_LISTVIEW object:nil];
    self.navigationItem.rightBarButtonItem = self.wordListBarButton;
    if (self.word == nil) {
        rootWordMeaningController = self;
        NSString* word = [[[UserData sharedUserData] historyWords] firstObject];
        if (word == nil || [word isEqualToString:@""])
            word = @"welcome";
        self.word = [[WordManager sharedWordManager] findWordByCompleteWord:word];
        return;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self resetWordWithWord:self.word];
}

- (void)viewDidAppear:(BOOL)animated
{
    instanceWordMeaningController = self;
    self.navigationController.navigationBar.barTintColor = [UIColor meaningViewBackgroundColor];
    if (self.isNeedPop) {
        [self.navigationController popViewControllerAnimated:NO];
    }
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

- (void)clearAllViews
{
    for (UIView* view in self.scrollView.subviews) {
        [view removeFromSuperview];
    }
}

- (void)resetWordWithWord:(Word*)word
{
    self.title = word.word;
    self.wordListBarButton.tintColor = [UIColor markWordColorWithWord:self.word.word];

    [self clearAllViews];

    //sort
    NSMutableArray* keyArray = [[NSMutableArray alloc] init];
    for (id obj in word.meaning) {
        [keyArray addObject:obj];
    }
    [keyArray sortUsingComparator:^NSComparisonResult(NSString* a, NSString* b) {
            return [a compare:b];
    }];

    //add new subview
    CGRect relaViewRect;
    float height = 20;
    for (id obj in keyArray) {
        WordMeaningView* meaningView = [[WordMeaningView alloc] initWithWidth:self.view.frame.size.width - 20];
        [meaningView setWord:obj andMeaning:word.meaning[obj]];
        meaningView.delegate = self;
        meaningView.word = self.word.word;
        meaningView.frame = CGRectMake(10, height, meaningView.frame.size.width, meaningView.frame.size.height);
        [self.scrollView addSubview:meaningView];
        height += meaningView.frame.size.height + 20;
        relaViewRect = meaningView.frame;
    }

    //add relatedwordTable view
    relaViewRect.origin.y = height;
    RelatedWordTableView* relatedWordTableView = [self getRelaWordViewWithRect:relaViewRect];
    height += relatedWordTableView.frame.size.height + 20;
    [self.scrollView addSubview:relatedWordTableView];

    height = MAX(self.view.frame.size.height + 1, height);
    self.scrollView.contentSize = CGSizeMake(0, height);
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.scrollView.scrollEnabled = YES;
}

- (BOOL)isNeedHintWithWord:(NSString*)touchWord
{
    NSDictionary* item = [self.hint objectForKey:self.word.word];
    if (item) {
        NSString* filePath = nil;
        if ((filePath = [item objectForKey:touchWord]) != nil) {
            HintViewController* hintController = [[HintViewController alloc] initWithHtmlFile:filePath];
            [[WordMeaningController rootViewController].navigationController pushViewController:hintController animated:YES];
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
        }
        if (wordEntity != nil && ![wordEntity.word isEqualToString:self.word.word]) {
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

+ (WordMeaningController*)instanceViewController
{
    return instanceWordMeaningController;
}

+ (WordMeaningController*)rootViewController
{
    return rootWordMeaningController;
}

#pragma mark - related word
- (RelatedWordTableView*)getRelaWordViewWithRect:(CGRect)rect
{
    NSArray* array = self.word.releatedWord;
    if (array == nil || array.count == 0)
        return nil;

    array = [array sortedArrayUsingComparator:^NSComparisonResult(NSString* a, NSString* b) {
        return [[a getSortString] compare:[b getSortString]];
    }];

    RelatedWordTableView* relatedWordTableView = [[RelatedWordTableView alloc] initWithData:array andRect:rect];
    relatedWordTableView.relaDelegate = self;
    return relatedWordTableView;
}

- (void)selectWordAtRelaWordView:(NSString*)wordStr
{
    [self wordTapCallBack:wordStr];
}

#pragma mark rotate

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self resetWordWithWord:self.word];
}

#pragma mark - mark to word list

- (void)toggleWordListBarButton:(id)sender
{
    [[MarkWordManager sharedMarkWordManager] toggleWordList:self.word.word];
    self.wordListBarButton.tintColor = [UIColor markWordColorWithWord:self.word.word];
    [[NSNotificationCenter defaultCenter] postNotificationName:BOOKMARKS_CHANGE_AT_MEANINGVIEW object:self.word.word];
}

- (void)resetBookmark:(NSNotification*)nofication
{
    NSString* wordText = nofication.object;
    if ([wordText isEqualToString:self.word.word]) {
        self.wordListBarButton.tintColor = [UIColor markWordColorWithWord:self.word.word];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
