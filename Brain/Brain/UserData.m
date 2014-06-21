//
//  UserData.m
//  Brain
//
//  Created by 邱峰 on 6/21/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import "UserData.h"

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


@end
