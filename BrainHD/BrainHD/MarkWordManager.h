//
//  MarkWordManager.h
//  Brain
//
//  Created by 邱峰 on 6/25/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkWord.h"

@interface MarkWordManager : NSObject

+ (MarkWordManager*)sharedMarkWordManager;

- (void)addWordToList:(NSString*)wordStr;

- (void)deleteWordFromList:(NSString*)wordStr;

- (void)toggleWordList:(NSString*)wordStr;

@end
