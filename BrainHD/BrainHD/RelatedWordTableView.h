//
//  RelatedWordTableView.h
//  Brain
//
//  Created by 邱峰 on 6/21/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RelatedWordTableViewProtocol <NSObject>

- (void)selectWordAtRelaWordView:(NSString*)wordStr;

@end

@interface RelatedWordTableView : UITableView

- (instancetype)initWithData:(NSArray*)data andRect:(CGRect)rect;

@property (nonatomic, weak) id<RelatedWordTableViewProtocol> relaDelegate;

@end
