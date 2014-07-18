//
//  AppDelegate.m
//  BrainDatabase
//
//  Created by 邱峰 on 14-2-23.
//  Copyright (c) 2014年 邱峰. All rights reserved.
//

#import "AppDelegate.h"
#import "WordEntity.h"

@implementation AppDelegate {
    NSMutableArray* tmpWord;
    NSArray* array;
}

- (NSArray*)getData
{
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"WordPlist" ofType:@"plist"];
    NSData* data = [NSData dataWithContentsOfFile:plistPath];
    NSError* error;
    NSPropertyListFormat format;
    return [NSPropertyListSerialization propertyListWithData:data options:0 format:&format error:&error];
}

- (NSString*)getWordTextWithoutProperty:(NSString*)wordText
{
    NSString* result = [[NSString alloc] initWithString:wordText];

    NSRange range;
    if ((range = [result rangeOfString:@"("]).location != NSNotFound) {
        result = [result substringToIndex:range.location];
    }
    result = [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return result;
}

- (Word*)getWordEntityWithCh:(char)ch
{
    switch (ch) {
    case 'a':
        return [WordA createEntity];
    case 'b':
        return [WordB createEntity];
    case 'c':
        return [WordC createEntity];
    case 'd':
        return [WordD createEntity];
    case 'e':
        return [WordE createEntity];
    case 'f':
        return [WordF createEntity];
    case 'g':
        return [WordG createEntity];
    case 'h':
        return [WordH createEntity];
    case 'i':
        return [WordI createEntity];
    case 'j':
        return [WordJ createEntity];
    case 'k':
        return [WordK createEntity];
    case 'l':
        return [WordL createEntity];
    case 'm':
        return [WordM createEntity];
    case 'n':
        return [WordN createEntity];
    case 'o':
        return [WordO createEntity];
    case 'p':
        return [WordP createEntity];
    case 'q':
        return [WordQ createEntity];
    case 'r':
        return [WordR createEntity];
    case 's':
        return [WordS createEntity];
    case 't':
        return [WordT createEntity];
    case 'u':
        return [WordU createEntity];
    case 'v':
        return [WordV createEntity];
    case 'w':
        return [WordW createEntity];
    case 'x':
        return [WordX createEntity];
        break;
    case 'y':
        return [WordY createEntity];
    case 'z':
        return [WordZ createEntity];
    default:
        break;
    }
    return nil;
}

- (BOOL)isLetter:(char)ch
{
    if (ch >= 'a' && ch <= 'z')
        return YES;
    if (ch >= 'A' && ch <= 'Z')
        return YES;
    return NO;
}

- (int)getIndexAtTmpArray:(NSString*)word
{
    // [self showTmpWord];
    int l = 0;
    int r = tmpWord.count;
    while (l < r) {
        int mid = (l + r) >> 1;
        Word* indexWord = tmpWord[mid];
        if ([indexWord.word isEqualToString:word])
            return mid;
        else if ([indexWord.word compare:word] == NSOrderedDescending)
            r = mid;
        else
            l = mid + 1;
    }
    return l;
}

- (void)showTmpWord
{
    int i = 0;
    for (Word* word in tmpWord) {
        NSLog(@"%d  %@", i++, word.word);
    }
}

- (void)insertIntoTmpWord:(Word*)word atIndex:(int)index
{
    [tmpWord insertObject:word atIndex:index];
    // [self showTmpWord];
}

- (void)setupDatabase
{
    BOOL isPrefix;
    array = [[self getData] copy];
    tmpWord = [[NSMutableArray alloc] init];

    for (int i = 0; i < array.count; i++) {
        NSString* wordKey = [[array objectAtIndex:i] objectForKey:@"word"];
        NSString* meaning = [[array objectAtIndex:i] objectForKey:@"meaning"];
        NSString* wordText = [self getWordTextWithoutProperty:wordKey];

        char ch = [wordText characterAtIndex:0];
        if (ch == '-') {
            isPrefix = YES;
            for (int i = 0; i < 100; i++) {
                ch = [wordText characterAtIndex:i];
                if ([self isLetter:ch])
                    break;
            }
        } else {
            isPrefix = NO;
        }

        if (ch >= 'A' && ch <= 'Z')
            ch = ch - 'A' + 'a';

        Word* newWord = nil;
        Word* prefixWord = nil;

        int index = [self getIndexAtTmpArray:wordText];
        if (tmpWord.count <= index || ![((Word*)tmpWord[index]).word isEqualToString:wordText]) {
            newWord = [self getWordEntityWithCh:ch];
            newWord.meaning = [[NSDictionary alloc] init];
            newWord.word = wordText;
            [self insertIntoTmpWord:newWord atIndex:index];

            if (isPrefix) {
                prefixWord = [WordPrefix createEntity];
                prefixWord.meaning = [[NSDictionary alloc] init];
                prefixWord.word = wordText;
            }

        } else {
            newWord = tmpWord[index];
            if (isPrefix) {
                prefixWord = [WordPrefix findFirstByAttribute:@"word" withValue:wordText];
            }
        }

        NSMutableDictionary* dictionary = [newWord.meaning mutableCopy];
        [dictionary setObject:meaning forKey:wordKey];
        newWord.meaning = [dictionary copy];

        if (isPrefix) {
            NSMutableDictionary* dictionary = [newWord.meaning mutableCopy];
            [dictionary setObject:meaning forKey:wordKey];
            prefixWord.meaning = [dictionary copy];
        }
    }
    [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
}

- (void)setupRela
{

    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"WordRela" ofType:@"plist"];
    NSData* data = [NSData dataWithContentsOfFile:plistPath];
    NSError* error;
    NSPropertyListFormat format;
    NSArray* relaArray = [NSPropertyListSerialization propertyListWithData:data options:0 format:&format error:&error];
    for (NSArray* wordsRela in relaArray) {
        if (wordsRela.count >= 1) {
            NSString* key = wordsRela[0];
            for (int j = 1; j < wordsRela.count; j++) {
                NSString* relaWord = wordsRela[j];
                [self addRelationWithStrWordA:key andWordB:relaWord];
            }
        }
    }
    [[NSManagedObjectContext defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)addRelation:(Word*)wordA andWordB:(Word*)wordB
{
    if (wordA == nil || wordB == nil)
        return;
    NSMutableArray* relaA = [wordA.releatedWord mutableCopy];
    NSMutableArray* relaB = [wordB.releatedWord mutableCopy];
    if (relaA == nil)
        relaA = [[NSMutableArray alloc] init];
    if (relaB == nil)
        relaB = [[NSMutableArray alloc] init];
    [relaA removeObject:wordB.word];
    [relaB removeObject:wordA.word];
    [relaA addObject:wordB.word];
    [relaB addObject:wordA.word];
    wordA.releatedWord = [relaA copy];
    wordB.releatedWord = [relaB copy];
}

- (void)addRelationWithStrWordA:(NSString*)a andWordB:(NSString*)b
{
    int indexA = [self getIndexAtTmpArray:a];
    int indexB = [self getIndexAtTmpArray:b];
    // NSLog(@"%@ %@", a, b);
    NSMutableArray* wordAArr = [[NSMutableArray alloc] init];
    NSMutableArray* wordBArr = [[NSMutableArray alloc] init];

    if (tmpWord.count > indexA && [((Word*)tmpWord[indexA]).word isEqualToString:a]) {
        [wordAArr addObject:tmpWord[indexA]];
    }

    if (tmpWord.count > indexB && [((Word*)tmpWord[indexB]).word isEqualToString:b]) {
        [wordBArr addObject:tmpWord[indexB]];
    }

    if ([a characterAtIndex:0] == '-') {
        WordPrefix* prefix = [WordPrefix findFirstByAttribute:@"word" withValue:a];
        if (prefix != nil) {
            [wordAArr addObject:prefix];
        }
    }
    if ([b characterAtIndex:0] == '-') {
        WordPrefix* prefix = [WordPrefix findFirstByAttribute:@"word" withValue:b];
        if (prefix != nil) {
            [wordBArr addObject:prefix];
        }
    }

    for (Word* a in wordAArr) {
        for (Word* b in wordBArr) {
            [self addRelation:a andWordB:b];
        }
    }
}

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    // Override point for customization after application launch.

    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Brain.sqlite"];

    [self setupDatabase];
    [self setupRela];
    [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];

    NSArray* array = [Word findAll];
    NSLog(@"%d", array.count);

    Word* word = [Word findFirstByAttribute:@"word" withValue:@"chin-up"];
    NSArray* relaWords = word.releatedWord;
    for (NSString* relaWord in relaWords) {
        NSLog(@"%@", relaWord);
    }

    [MagicalRecord cleanUp];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication*)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication*)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication*)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication*)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication*)application
{

    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
