//
//  UIColor+AppBackgroundColor.m
//  Brain
//
//  Created by 邱峰 on 6/21/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import "UIColor+AppColor.h"

@implementation UIColor (AppColor)

+ (UIColor*)meaningViewBackgroundColor
{
    return [UIColor colorWithRed:251.0 / 255.0 green:240.0 / 255.0 blue:217.0 / 255.0 alpha:1.0];
}

+ (UIColor*)titleLableColor
{
    return [UIColor colorWithRed:93.0 / 255.0 green:63.0 / 255.0 blue:47.0 / 255.0 alpha:1];
}

+ (UIColor*)cutOffColor
{
    return [UIColor colorWithRed:214.0 / 255.0 green:207.0 / 255.0 blue:195.0 / 255.0 alpha:1];
}

@end
