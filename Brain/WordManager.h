//
//  WordManager.h
//  Brain
//
//  Created by 邱峰 on 13-11-5.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface WordManager : NSObject

+ (WordManager*)sharedWordManager;

/*
 生成数据库
*/
- (BOOL)isDatabaseEmpty;

- (void)setupDatabase;

-(void)logData;

-(void)getAllWordFromPlist;


////////////////////////

-(void) getAllWord;

- (Word*)findWordByCompleteWord:(NSString*)word;

- (NSArray*)findWordContantArrayBySearchText:(NSString*)searchText;

@end
