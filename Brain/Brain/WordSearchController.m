//
//  ViewController.m
//  Brian
//
//  Created by 邱峰 on 13-11-3.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import "WordSearchController.h"
#import "Word.h"
#import "WordMeaningController.h"
#import "WordManager.h"
#import "NSAttributedString+Html2Attributed.h"

@interface WordSearchController ()
@property (weak, nonatomic) IBOutlet UITableView* tableView;

@property (nonatomic, retain) NSMutableArray* data;

@end

@implementation WordSearchController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray*)data
{
    if (_data == nil) {
        _data = [[NSMutableArray alloc] init];
    }
    return _data;
}

- (void)setSearchBar:(UISearchBar*)searchBar
{
    if (_searchBar != searchBar) {
        _searchBar = searchBar;
        _searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
        _searchBar.delegate = self;
    }
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    [self.searchBar resignFirstResponder];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.data == nil || self.data.count == 0)
        self.tableView.hidden = YES;
    else
        self.tableView.hidden = NO;
    return self.data.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyCell"];

    // Configure the cell...
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView*)scrollView
{
    [self.searchBar resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        return;
    }
    UITableViewCell* cell = sender;
    int selectIndex = (cell == nil) ? 0 : (int)[self.tableView indexPathForCell:cell].row;
    WordMeaningController* wordMeaningController = segue.destinationViewController;
    wordMeaningController.word = [[WordManager sharedWordManager] findWordByCompleteWord:[self.data objectAtIndex:selectIndex]];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar*)searchBar
{
    [self.tableView setContentOffset:CGPointZero animated:YES];
}

- (void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)searchText
{
    [self.data removeAllObjects];
    self.data = [[[WordManager sharedWordManager] findWordContantArrayBySearchText:searchText] mutableCopy];
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar*)searchBar
{
    if (self.data.count > 0) {
        WordMeaningController* wordMeaningController = [self.storyboard instantiateViewControllerWithIdentifier:@"WordMeaningController"];
        wordMeaningController.word = [[WordManager sharedWordManager] findWordByCompleteWord:[self.data firstObject]];
        [self.navigationController pushViewController:wordMeaningController animated:YES];
    }
}

@end
