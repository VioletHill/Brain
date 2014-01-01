//
//  NSString+sortString.m
//  Brain
//
//  Created by 邱峰 on 14-1-1.
//  Copyright (c) 2014年 邱峰. All rights reserved.
//

#import "NSString+sortString.h"

@implementation NSString (sortString)

-(NSString*)getSortString
{
    if ([self characterAtIndex:0]=='-')
    {
        return [[self.lowercaseString substringFromIndex:1] copy];
    }
    else return [self.lowercaseString copy];
}

@end
