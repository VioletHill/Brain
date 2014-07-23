//
//  RelatedWordTableView.m
//  Brain
//
//  Created by 邱峰 on 6/21/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import "RelatedWordTableView.h"
#import "UIColor+AppColor.h"

@interface RelatedWordTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray* data;

@end

@implementation RelatedWordTableView {
    CGRect selfFrame;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithData:(NSArray*)data andRect:(CGRect)rect
{
    if (self = [super init]) {
        selfFrame = rect;
        self.data = data;
        self.delegate = self;
        self.dataSource = self;
        self.tableHeaderView = [self getTableViewHeader];
        self.frame = CGRectMake(selfFrame.origin.x, selfFrame.origin.y, selfFrame.size.width, self.data.count * 44 + 44);
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UIView*)getTableViewHeader
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, selfFrame.size.width, 44)];
    view.backgroundColor = [UIColor meaningViewBackgroundColor];

    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, selfFrame.size.width - 10, 44 - 2)];
    label.text = @"RELATED WORDS";
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = [UIColor relatedWordsTitleColor];
    [view addSubview:label];

    UIView* cutOff = [[UIView alloc] initWithFrame:CGRectMake(0, 44 - 2, selfFrame.size.width, 2)];
    cutOff.backgroundColor = [UIColor cutOffColor];
    [view addSubview:cutOff];

    return view;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.data[indexPath.row];
    cell.textLabel.textColor = [UIColor titleLableColor];
    cell.backgroundColor = [UIColor meaningViewBackgroundColor];
    return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:NO];
    [self.relaDelegate selectWordAtRelaWordView:self.data[indexPath.row]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
