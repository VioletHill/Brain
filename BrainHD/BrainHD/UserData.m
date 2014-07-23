//
//  UserData.m
//  Brain
//
//  Created by 邱峰 on 6/21/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import "UserData.h"

const int totalHistoryWords = 25;

@implementation UserData

+ (UserData*)sharedUserData
{
    static UserData* _sharedUserData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^() {
        _sharedUserData=[[UserData alloc] init];
    });
    return _sharedUserData;
}

- (NSArray*)historyWords
{
    NSArray* array = [[NSUserDefaults standardUserDefaults] objectForKey:@"HistoryWords"];
    if (array == nil)
        array = [[NSArray alloc] init];
    return array;
}

- (void)setHistoryWords:(NSArray*)historyWords
{
    NSMutableArray* array = [historyWords mutableCopy];
    while (array.count > totalHistoryWords) {
        [array removeLastObject];
    }
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"HistoryWords"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)addHistoryWord:(NSString*)wordStr
{
    NSMutableArray* array = [self.historyWords mutableCopy];
    [array removeObject:wordStr];
    [array insertObject:wordStr atIndex:0];
    self.historyWords = [array copy];
}

- (void)deleteHistoryWord:(NSString*)wordStr
{
    NSMutableArray* array = [self.historyWords mutableCopy];
    [array removeObject:wordStr];
    self.historyWords = [array copy];
}

@end
