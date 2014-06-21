//
//  WordMeaningRootScrollView.m
//  Brain
//
//  Created by 邱峰 on 13-12-20.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import "WordMeaningRootScrollView.h"

@implementation UIScrollView (UITouch)

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
   // [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
    //[[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
    //[[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}

@end

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
