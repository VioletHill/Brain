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

@interface WordMeaningController ()<WordMeaingViewTapProtocol>

@property (strong, nonatomic) WordMeaningRootScrollView *scrollView;

@property (nonatomic,strong) NSMutableArray* meaningViewArray;

@property (nonatomic) BOOL isNeedPop;

@end

@implementation WordMeaningController
{
    BOOL isInit;
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

    [self resetWordWithWord:self.word];
}


-(void)viewDidAppear:(BOOL)animated
{
    if (self.isNeedPop)
    {
        [self.navigationController popViewControllerAnimated:NO];
    }
    if (isInit)
    {
        self.scrollView.contentOffset=CGPointMake(0, -64);
    }
    else
    {
        self.scrollView.contentOffset=CGPointMake(0, 0);
    }

}

-(WordMeaningRootScrollView*) scrollView
{
    if (_scrollView==nil)
    {
        self.view.backgroundColor=[UIColor colorWithRed:190.0/255.0 green:190.0/255.0 blue:190/255.0 alpha:1.0];

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
    if (height<self.view.frame.size.height)
    {
        height=self.view.frame.size.height;
    }
    [self.scrollView setContentSize:CGSizeMake(0, height)];
}

- (void)wordTapCallBack:(NSString *)word
{
    Word* wordEntity=nil;
    @try
    {
        wordEntity=[[WordManager sharedWordManager] findWordByCompleteWord:word];
        if (wordEntity==nil) wordEntity=[[WordManager sharedWordManager] findWordByCompleteWord:word.lowercaseString];
        
        if (wordEntity!=nil && [wordEntity.word isEqualToString:self.word.word])
        {
            WordMeaningController* nextController=[[WordMeaningController alloc] init];
            nextController.word=wordEntity;
            nextController.isNeedPop=YES;
            [self.navigationController pushViewController:nextController animated:YES];
            
        }
        if (wordEntity!=nil && ![wordEntity.word isEqualToString:self.word.word])
        {
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
