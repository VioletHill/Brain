//
//  UserData.h
//  Brain
//
//  Created by 邱峰 on 6/21/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject

+ (UserData*)sharedUserData;

- (void)addHistoryWord:(NSString*)wordStr;

- (void)deleteHistoryWord:(NSString*)wordStr;

@property (nonatomic, strong) NSArray* historyWords;

@end
