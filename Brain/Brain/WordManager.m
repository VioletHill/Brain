//
//  WordManager.m
//  Brain
//
//  Created by 邱峰 on 13-11-5.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import "WordManager.h"

#import "NSString+sortString.h"

@interface WordManager ()

@property (nonatomic, strong) NSArray* wordA;
@property (nonatomic, strong) NSArray* wordB;
@property (nonatomic, strong) NSArray* wordC;
@property (nonatomic, strong) NSArray* wordD;
@property (nonatomic, strong) NSArray* wordE;
@property (nonatomic, strong) NSArray* wordF;
@property (nonatomic, strong) NSArray* wordG;
@property (nonatomic, strong) NSArray* wordH;
@property (nonatomic, strong) NSArray* wordI;
@property (nonatomic, strong) NSArray* wordJ;
@property (nonatomic, strong) NSArray* wordK;
@property (nonatomic, strong) NSArray* wordL;
@property (nonatomic, strong) NSArray* wordM;
@property (nonatomic, strong) NSArray* wordN;
@property (nonatomic, strong) NSArray* wordO;
@property (nonatomic, strong) NSArray* wordP;
@property (nonatomic, strong) NSArray* wordQ;
@property (nonatomic, strong) NSArray* wordR;
@property (nonatomic, strong) NSArray* wordS;
@property (nonatomic, strong) NSArray* wordT;
@property (nonatomic, strong) NSArray* wordU;
@property (nonatomic, strong) NSArray* wordV;
@property (nonatomic, strong) NSArray* wordW;
@property (nonatomic, strong) NSArray* wordX;
@property (nonatomic, strong) NSArray* wordY;
@property (nonatomic, strong) NSArray* wordZ;
@property (nonatomic, strong) NSArray* wordPrefix;

@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;

@end

@implementation WordManager

+ (WordManager*)sharedWordManager
{
    static WordManager* wordManager = nil;
    if (wordManager == nil) {
        wordManager = [[WordManager alloc] init];
    }
    return wordManager;
}

- (NSManagedObjectContext*)managedObjectContext
{
    if (_managedObjectContext == nil) {
        NSURL* modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];

        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];

        NSURL* sqlite = [[NSBundle mainBundle] URLForResource:@"Brain" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContext;
}

- (NSArray*)getEntityWithRequest:(NSFetchRequest*)request
{
    return [[self.managedObjectContext executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a, Word* b) {
        NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
        if (result==NSOrderedSame)
        {
            return [a.word compare:b.word];
        }
        else return result;
    }];
}

- (NSArray*)wordA
{
    if (_wordA == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordA" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordA = [self getEntityWithRequest:request];
    }
    return _wordA;
}

- (NSArray*)wordB
{
    if (_wordB == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordB" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordB = [self getEntityWithRequest:request];
    }
    return _wordB;
}

- (NSArray*)wordC
{
    if (_wordC == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordC" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordC = [self getEntityWithRequest:request];
    }
    return _wordC;
}

- (NSArray*)wordD
{
    if (_wordD == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordD" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordD = [self getEntityWithRequest:request];
    }
    return _wordD;
}

- (NSArray*)wordE
{
    if (_wordE == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordE" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordE = [self getEntityWithRequest:request];
    }
    return _wordE;
}

- (NSArray*)wordF
{
    if (_wordF == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordF" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordF = [self getEntityWithRequest:request];
    }
    return _wordF;
}

- (NSArray*)wordG
{
    if (_wordG == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordG" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordG = [self getEntityWithRequest:request];
    }
    return _wordG;
}

- (NSArray*)wordH
{
    if (_wordH == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordH" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordH = [self getEntityWithRequest:request];
    }
    return _wordH;
}

- (NSArray*)wordI
{
    if (_wordI == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordI" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordI = [self getEntityWithRequest:request];
    }
    return _wordI;
}

- (NSArray*)wordJ
{
    if (_wordJ == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordJ" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordJ = [self getEntityWithRequest:request];
    }
    return _wordJ;
}

- (NSArray*)wordK
{
    if (_wordK == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordK" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordK = [self getEntityWithRequest:request];
    }
    return _wordK;
}

- (NSArray*)wordL
{
    if (_wordL == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordL" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordL = [self getEntityWithRequest:request];
    }
    return _wordL;
}

- (NSArray*)wordM
{
    if (_wordM == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordM" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordM = [self getEntityWithRequest:request];
    }
    return _wordM;
}

- (NSArray*)wordN
{
    if (_wordN == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordN" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordN = [self getEntityWithRequest:request];
    }
    return _wordN;
}

- (NSArray*)wordO
{
    if (_wordO == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordO" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordO = [self getEntityWithRequest:request];
    }
    return _wordO;
}

- (NSArray*)wordP
{
    if (_wordP == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordP" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordP = [self getEntityWithRequest:request];
    }
    return _wordP;
}

- (NSArray*)wordQ
{
    if (_wordQ == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordQ" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordQ = [self getEntityWithRequest:request];
    }
    return _wordQ;
}

- (NSArray*)wordR
{
    if (_wordR == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordR" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordR = [self getEntityWithRequest:request];
    }
    return _wordR;
}

- (NSArray*)wordS
{
    if (_wordS == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordS" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordS = [self getEntityWithRequest:request];
    }
    return _wordS;
}

- (NSArray*)wordT
{
    if (_wordT == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordT" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordT = [self getEntityWithRequest:request];
    }
    return _wordT;
}

- (NSArray*)wordU
{
    if (_wordU == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordU" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordU = [self getEntityWithRequest:request];
    }
    return _wordU;
}

- (NSArray*)wordV
{
    if (_wordV == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordV" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordV = [self getEntityWithRequest:request];
    }
    return _wordV;
}

- (NSArray*)wordW
{
    if (_wordW == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordW" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordW = [self getEntityWithRequest:request];
    }
    return _wordW;
}

- (NSArray*)wordX
{
    if (_wordX == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordX" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordX = [self getEntityWithRequest:request];
    }
    return _wordX;
}

- (NSArray*)wordY
{
    if (_wordY == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordY" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordY = [self getEntityWithRequest:request];
    }
    return _wordY;
}

- (NSArray*)wordZ
{
    if (_wordZ == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordZ" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordZ = [self getEntityWithRequest:request];
    }
    return _wordZ;
}

- (NSArray*)wordPrefix
{
    if (_wordPrefix == nil) {
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity = [NSEntityDescription entityForName:@"WordPrefix" inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        _wordPrefix = [[self.managedObjectContext executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a, Word* b) {
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
    }
    return _wordPrefix;
}

#pragma mark - algorithm

- (void)preparedWord
{
    [self wordS];
    [self wordC];
    [self wordA];
    [self wordM];
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

- (int)getWord:(NSString*)wordText indexAtTmpArray:(NSArray*)arr
{
    if (arr == nil || arr.count == 0)
        return 0;
    int l = 0;
    int r = (int)[arr count];
    while (l < r) {
        int mid = (l + r) >> 1;
        Word* findWord = [arr objectAtIndex:mid];

        if ([findWord.word compare:wordText] == NSOrderedSame)
            return mid;

        if ([findWord.word compare:wordText] == NSOrderedAscending) {
            l = mid + 1;
        } else {
            r = mid;
        }
    }
    return l;
}

- (NSArray*)getSearchArrayByWord:(NSString*)word
{
    char ch = [word.lowercaseString characterAtIndex:0];
    switch (ch) {
    case '-':
        return self.wordPrefix;
    case 'a':
        return self.wordA;
    case 'b':
        return self.wordB;
    case 'c':
        return self.wordC;
    case 'd':
        return self.wordD;
    case 'e':
        return self.wordE;
    case 'f':
        return self.wordF;
    case 'g':
        return self.wordG;
    case 'h':
        return self.wordH;
    case 'i':
        return self.wordI;
    case 'j':
        return self.wordJ;
    case 'k':
        return self.wordK;
    case 'l':
        return self.wordL;
    case 'm':
        return self.wordM;
    case 'n':
        return self.wordN;
    case 'o':
        return self.wordO;
    case 'p':
        return self.wordP;
    case 'q':
        return self.wordQ;
    case 'r':
        return self.wordR;
    case 's':
        return self.wordS;
    case 't':
        return self.wordT;
    case 'u':
        return self.wordU;
    case 'v':
        return self.wordV;
    case 'w':
        return self.wordW;
    case 'x':
        return self.wordX;
    case 'y':
        return self.wordY;
    case 'z':
        return self.wordZ;
    default:
        break;
    }
    return nil;
}

- (Word*)findWordByCompleteWord:(NSString*)word
{
    if (word == nil || [word isEqualToString:@""])
        return nil;
    for (Word* obj in [self getSearchArrayByWord:word]) {
        if ([obj.word isEqualToString:word])
            return obj;
    }
    return nil;
}

- (NSArray*)findWordContantArrayBySearchText:(NSString*)searchText
{
    if (searchText == nil || [searchText isEqualToString:@""])
        return nil;
    searchText = searchText.lowercaseString;

    NSArray* searchArray = [self getSearchArrayByWord:searchText];

    NSMutableArray* data = [[NSMutableArray alloc] init];
    int l = 0;
    int r = (int)searchArray.count;

    while (l < r) {
        int mid = (l + r) >> 1;
        NSString* a = [((Word*)[searchArray objectAtIndex:mid]).word getSortString];
        NSComparisonResult result = [a compare:[searchText getSortString]];
        if (result == NSOrderedSame) {
            l = mid;
            break;
        } else if (result == NSOrderedAscending) {
            l = mid + 1;
        } else
            r = mid;
    }

    //单词有重复的 比如 china 和 China
    while (l >= 1) {
        NSComparisonResult result = [[((Word*)[searchArray objectAtIndex:l - 1]).word getSortString] compare:[searchText getSortString]];
        if (result == NSOrderedSame)
            l--;
        else
            break;
    }

    for (int i = l; i < MIN(l + 25, searchArray.count); i++) {
        [data addObject:((Word*)[searchArray objectAtIndex:i]).word];
    }
    return data;
}

@end
