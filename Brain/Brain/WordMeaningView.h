//
//  WordMeaningView.h
//  Brain
//
//  Created by 邱峰 on 13-12-18.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WordMeaingViewTapProtocol <NSObject>

@optional

- (void)wordTapCallBack:(NSString*)word;

@end

@interface WordMeaningView : UIView

- (instancetype)initWithWord:(NSString*)word andMeaning:(NSString*)meaning;

@property (nonatomic, weak) NSString* word;

@property (nonatomic, weak) id<WordMeaingViewTapProtocol> delegate;

@end
