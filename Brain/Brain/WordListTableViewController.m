//
//  WordListTableViewController.m
//  Brain
//
//  Created by 邱峰 on 6/25/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import "WordListTableViewController.h"
#import "MarkWordManager.h"
#import "WordManager.h"
#import "WordMeaningController.h"

@interface WordListTableViewController ()

@property (nonatomic, strong) NSArray* data;

@end

@implementation WordListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    [self loadData];
    [self.tableView reloadData];
}

- (NSArray*)data
{
    if (_data == nil) {
        [self loadData];
    }
    return _data;
}

- (void)loadData
{
    _data = [MarkWord MR_findByAttribute:@"isMark" withValue:@(YES)];
    if (_data == nil) {
        _data = [[NSArray alloc] init];
    }
    _data=[_data sortedArrayUsingComparator:^NSComparisonResult(MarkWord* a, MarkWord*b){
        return [a.word.lowercaseString compare:b.word.lowercaseString];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"WordListCell" forIndexPath:indexPath];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    MarkWord* markWord = self.data[indexPath.row];
    cell.textLabel.text = markWord.word;

    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UITableViewCell* cell=[self.tableView cellForRowAtIndexPath:indexPath];
        [[MarkWordManager sharedMarkWordManager] deleteWordFromList:cell.textLabel.text];
        [self loadData];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell* cell = sender;
    WordMeaningController* wordMeaningController = segue.destinationViewController;
    
    NSString* word = cell.textLabel.text;
    
    wordMeaningController.word = [[WordManager sharedWordManager] findWordByCompleteWord:word];
}


@end
