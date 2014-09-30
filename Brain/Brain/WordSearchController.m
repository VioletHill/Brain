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
#import "UserData.h"

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
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* array = [UserData sharedUserData].historyWords;

    if ((self.data == nil || self.data.count == 0) && array.count == 0)
        self.tableView.hidden = YES;
    else
        self.tableView.hidden = NO;

    return self.data.count == 0 ? array.count : self.data.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyCell"];

    if (self.data == nil || self.data.count == 0)
        cell.textLabel.text = [UserData sharedUserData].historyWords[indexPath.row];
    else
        cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (self.data.count == 0)
        return YES;
    else
        return NO;
}

- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString* str = [[UserData sharedUserData] historyWords][indexPath.row];
        [[UserData sharedUserData] deleteHistoryWord:str];
        [self.tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];
        if ([[UserData sharedUserData] historyWords].count == 0) {
            self.tableView.hidden = YES;
        }
    }
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    WordMeaningController* wordMeaningController = [[WordMeaningController alloc] init];
    wordMeaningController.word = [[WordManager sharedWordManager] findWordByCompleteWord:cell.textLabel.text];
    [self.navigationController pushViewController:wordMeaningController animated:YES];
}

#pragma mark - scrollView delegate

- (void)scrollViewWillBeginDragging:(UIScrollView*)scrollView
{
    [self.searchBar resignFirstResponder];
}

#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UIBarButtonItem class]])
        return;

    UITableViewCell* cell = sender;
    WordMeaningController* wordMeaningController = segue.destinationViewController;

    NSString* word = cell.textLabel.text;
    [[UserData sharedUserData] addHistoryWord:word];
    wordMeaningController.word = [[WordManager sharedWordManager] findWordByCompleteWord:word];
}

#pragma mark - search delegate

- (void)searchBarTextDidBeginEditing:(UISearchBar*)searchBar
{
    [self.tableView setContentOffset:CGPointZero animated:YES];
}

- (void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)searchText
{
    NSString* text = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    [self.data removeAllObjects];
    self.data = [[[WordManager sharedWordManager] findWordContantArrayBySearchText:text] mutableCopy];
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar*)searchBar
{
    if (self.data.count > 0) {
        WordMeaningController* wordMeaningController = [[WordMeaningController alloc] init];
        wordMeaningController.word = [[WordManager sharedWordManager] findWordByCompleteWord:[self.data firstObject]];
        [self.navigationController pushViewController:wordMeaningController animated:YES];
    }
}

@end
