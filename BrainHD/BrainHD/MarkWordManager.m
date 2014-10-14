//
//  MarkWordManager.m
//  Brain
//
//  Created by 邱峰 on 6/25/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import "MarkWordManager.h"
#import<CoreData+MagicalRecord.h>

@implementation MarkWordManager

+ (MarkWordManager*)sharedMarkWordManager
{
    static MarkWordManager* _sharedMarkWordManager = nil;
    static dispatch_once_t markWordManagerToken;
    dispatch_once(&markWordManagerToken, ^(void) {
        _sharedMarkWordManager=[[MarkWordManager alloc] init];
    });
    return _sharedMarkWordManager;
}

- (void)addWordToList:(NSString*)wordStr
{
    MarkWord* markWord = [MarkWord MR_findFirstByAttribute:@"word" withValue:wordStr];
    if (markWord == nil) {
        markWord = [MarkWord MR_createEntity];
        markWord.word = wordStr;
    }
    markWord.isMark = @(YES);
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)deleteWordFromList:(NSString*)wordStr
{
    MarkWord* markWord = [MarkWord MR_findFirstByAttribute:@"word" withValue:wordStr];
    if (markWord == nil)
        return;
    markWord.isMark = @(NO);
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)toggleWordList:(NSString*)wordStr
{
    MarkWord* markWord = [MarkWord MR_findFirstByAttribute:@"word" withValue:wordStr];
    NSLog(@"%@",markWord.isMark);
    if (markWord == nil || ![markWord.isMark boolValue]) {
        [self addWordToList:wordStr];
    } else {
        [self deleteWordFromList:wordStr];
    }
}

@end
