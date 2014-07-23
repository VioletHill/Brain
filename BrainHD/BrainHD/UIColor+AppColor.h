//
//  UIColor+AppBackgroundColor.h
//  Brain
//
//  Created by 邱峰 on 6/21/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AppColor)

+ (UIColor*)meaningViewBackgroundColor;

+ (UIColor*)titleLableColor;

+ (UIColor*)cutOffColor;

+ (UIColor*)markWordColorWithWord:(NSString*)word;

+ (UIColor*)relatedWordsTitleColor;

@end
