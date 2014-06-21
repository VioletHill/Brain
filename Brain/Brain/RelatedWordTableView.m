//
//  RelatedWordTableView.m
//  Brain
//
//  Created by 邱峰 on 6/21/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import "RelatedWordTableView.h"

@interface RelatedWordTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray* data;

@end

@implementation RelatedWordTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithData:(NSArray*)data
{
    if (self = [super init]) {
        self.data = data;
        self.delegate = self;
        self.dataSource = self;
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

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    return cell;
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
