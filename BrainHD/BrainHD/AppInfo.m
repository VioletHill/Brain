//
//  AppInfo.m
//  Brain
//
//  Created by 邱峰 on 9/30/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

+ (NSString*)appVersion
{
    NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString* appVersion = [infoDictionary objectForKey:@"CFBundleVersion"];
    return appVersion;
}

@end
