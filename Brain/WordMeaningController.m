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

#import "HintViewController.h"

@interface WordMeaningController ()<WordMeaingViewTapProtocol>

@property (strong, nonatomic) WordMeaningRootScrollView *scrollView;

@property (nonatomic,strong) NSMutableArray* meaningViewArray;

@property (nonatomic) BOOL isNeedPop;

@property (nonatomic,strong) NSDictionary* hint;

@end

@implementation WordMeaningController
{
    BOOL isInit;
    BOOL isNeedResetPosition;
}

-(instancetype) init
{
    if (self=[super init])
    {
        isInit=YES;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:251.0/4 green:240.0/255.0 blue:217.0/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:93.0/255.0 green:63.0/255.0 blue:39.0/255.0 alpha:1] forKey:NSForegroundColorAttributeName];

    [self resetWordWithWord:self.word];
}


-(void)viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:251.0/4 green:240.0/255.0 blue:217.0/255.0 alpha:1];
    if (self.isNeedPop)
    {
        [self.navigationController popViewControllerAnimated:NO];
    }
    if (!isNeedResetPosition)
    {
        if (isInit)
        {
            self.scrollView.contentOffset=CGPointMake(0, -64);
        }
        else
        {
            self.scrollView.contentOffset=CGPointMake(0, 0);
        }
    }
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

-(WordMeaningRootScrollView*) scrollView
{
    if (_scrollView==nil)
    {
        self.view.backgroundColor=[UIColor colorWithRed:172.0/255.0 green:154.0/255.0 blue:137.0/255.0 alpha:1.0];

        if (isInit)
        {
            _scrollView=(WordMeaningRootScrollView*)[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
        }
        else
        {
            _scrollView=(WordMeaningRootScrollView*)[[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height-64)];
        }

        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

-(NSMutableArray*) meaningViewArray
{
    if (_meaningViewArray==nil)
    {
        _meaningViewArray=[[NSMutableArray alloc] init];
    }
    return _meaningViewArray;
}

- (void)clearAllMeaningViews
{
    for (UIView* view in self.meaningViewArray)
    {
        [view removeFromSuperview];
    }
    [self.meaningViewArray removeAllObjects];
}

- (void)resetWordWithWord:(Word*)word
{
    self.title=word.word;
    
    [self clearAllMeaningViews];
    
    
    //sort
    NSMutableArray* keyArray=[[NSMutableArray alloc] init];
    for (id obj in word.meaning)
    {
        [keyArray addObject:obj];
    }
    [keyArray sortUsingComparator:^NSComparisonResult(NSString* a, NSString* b){
            return [a compare:b];
    }];
    
    //add new subview
    float height=20;
    for (id obj in keyArray)
    {
        WordMeaningView* meaingView=[[WordMeaningView alloc] initWithWord:obj andMeaning:[word.meaning objectForKey:obj]];
        meaingView.delegate=self;
        meaingView.frame=CGRectMake(meaingView.frame.origin.x, height, meaingView.frame.size.width, meaingView.frame.size.height);
        [self.meaningViewArray addObject:meaingView];
        [self.scrollView addSubview:meaingView];
        height+=meaingView.frame.size.height+20;
    }
    
    self.scrollView.contentOffset=CGPointMake(0, 0);
    if (height<self.view.frame.size.height-63)
    {
        height=self.view.frame.size.height-63;
    }
    [self.scrollView setContentSize:CGSizeMake(0, height)];
    self.scrollView.scrollEnabled=YES;
}

-(BOOL) isNeedHintWithWord:(NSString*)touchWord
{
    NSDictionary* item=[self.hint objectForKey:self.word.word];
    if (item)
    {
        NSString* filePath=nil;
        if ((filePath=[item objectForKey:touchWord])!=nil)
        {
            HintViewController* hintController=[[HintViewController alloc] initWithHtmlFile:filePath];
            [self.navigationController pushViewController:hintController animated:YES];
            return YES;
        }
        else return NO;
    }
    return NO;
}

- (void)wordTapCallBack:(NSString *)word
{
    Word* wordEntity=nil;
    NSLog(@"%@",word);
    @try
    {
        if ([self isNeedHintWithWord:word])
        {
            isNeedResetPosition=YES;
            return ;
        }
        
        wordEntity=[[WordManager sharedWordManager] findWordByCompleteWord:word];
        if (wordEntity==nil) wordEntity=[[WordManager sharedWordManager] findWordByCompleteWord:word.lowercaseString];
        
        if (wordEntity!=nil && [wordEntity.word isEqualToString:self.word.word])
        {
            isNeedResetPosition=NO;
            WordMeaningController* nextController=[[WordMeaningController alloc] init];
            nextController.word=wordEntity;
            nextController.isNeedPop=YES;
            [self.navigationController pushViewController:nextController animated:YES];
            
        }
        if (wordEntity!=nil && ![wordEntity.word isEqualToString:self.word.word])
        {
            isNeedResetPosition=YES;
            WordMeaningController* nextController=[[WordMeaningController alloc] init];
            nextController.word=wordEntity;
            [self.navigationController pushViewController:nextController animated:YES];
        }
    }
    @catch (NSException *exception)
    {
        
    }
    @finally
    {
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
