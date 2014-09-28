//
//  WordListTableViewController.m
//  Brain
//
//  Created by 邱峰 on 6/25/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import "WordListViewController.h"
#import "MarkWordManager.h"
#import "WordManager.h"
#import "WordMeaningController.h"
#import "NSString+sortString.h"
#import <MagicalRecord/CoreData+MagicalRecord.h>

@interface WordListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView* tableView;
@property (weak, nonatomic) IBOutlet UITextView* hintView;
@property (nonatomic, strong) NSMutableArray* data;

@end

@implementation WordListViewController

@synthesize data = _data;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    [self loadData];
}

- (NSMutableArray*)data
{
    if (_data == nil) {
        [self loadData];
    }
    return _data;
}

- (void)setData:(NSMutableArray*)data
{
    if (_data != data) {
        _data = data;
        if (_data == nil || _data.count == 0) {
            self.tableView.hidden = YES;
            self.hintView.hidden = NO;
        } else {
            self.hintView.hidden = YES;
            self.tableView.hidden = NO;
            dispatch_async(dispatch_get_main_queue(), ^() {
                [self.tableView reloadData];
            });
        }
    }
}

- (void)loadData
{
    NSArray* result = [MarkWord MR_findByAttribute:@"isMark" withValue:@(YES)];
    if (result == nil) {
        result = [[NSArray alloc] init];
    }
    self.data = [[result sortedArrayUsingComparator:^NSComparisonResult(MarkWord* a, MarkWord* b) {
        return [a.word.getSortString compare:b.word.getSortString];
    }] mutableCopy];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"WordListCell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    MarkWord* markWord = self.data[indexPath.row];
    cell.textLabel.text = markWord.word;

    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath*)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
        [[MarkWordManager sharedMarkWordManager] deleteWordFromList:cell.textLabel.text];
        [self.data removeObjectAtIndex:indexPath.row];
        if (self.data.count == 0) {
            self.tableView.hidden = YES;
            self.hintView.hidden = NO;
        } else {
            self.tableView.hidden = NO;
            self.hintView.hidden = YES;
        }
        [tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    UITableViewCell* cell = sender;
    WordMeaningController* wordMeaningController = segue.destinationViewController;

    NSString* word = cell.textLabel.text;

    wordMeaningController.word = [[WordManager sharedWordManager] findWordByCompleteWord:word];
}

@end
