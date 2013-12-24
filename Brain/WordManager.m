//
//  WordManager.m
//  Brain
//
//  Created by 邱峰 on 13-11-5.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import "WordManager.h"


@interface WordManager()

@property (nonatomic,strong) NSArray* allWord;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@end



@implementation WordManager



+ (WordManager*)sharedWordManager
{
    static WordManager* wordManager=nil;
    if (wordManager==nil)
    {
        wordManager=[[WordManager alloc] init];
    }
    return wordManager;
}

-(void) sortAllWord
{
    
}

-(void) getAllWord
{
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
    
    NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
    
    NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"Brain" withExtension:@"sqlite"];
    [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
    _managedObjectContext=[[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];

    NSFetchRequest *request=[[NSFetchRequest alloc] init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: _managedObjectContext];
    [request setEntity:entity];
    self.allWord=[[_managedObjectContext executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
        return [a.word.lowercaseString compare:b.word.lowercaseString];
    }];
    
}


- (BOOL)isDatabaseEmpty
{
    if ([Word findFirst]==nil)
    {
        return YES;
    }
    return NO;
}


-(void)getAllWordFromPlist
{
    self.allWord=[[self getData] sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(Word* a,Word* b){
        return [a.word.lowercaseString compare:b.word.lowercaseString];
    }];
}


-(NSString*)getWordTextWithoutProperty:(NSString*)wordText
{
    NSString* result=[[NSString alloc] initWithString:wordText];
    
    NSRange range;
    if ( (range=[result rangeOfString:@"("]).location!=NSNotFound)
    {
        result=[result substringToIndex:range.location];
    }
    result=[result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return result;
}

-(int)getWord:(NSString*)wordText indexAtTmpArray:(NSArray*)arr
{
    if (arr==nil || arr.count==0 ) return 0;
    int l=0;
    int r=(int)[arr count];
    while (l<r)
    {
        int mid=(l+r)>>1;
        Word* findWord=[arr objectAtIndex:mid];
        
        if ([findWord.word compare:wordText]==NSOrderedSame) return mid;
        
        if ([findWord.word compare:wordText]==NSOrderedAscending)
        {
            l=mid+1;
        }
        else
        {
            r=mid;
        }
    }
    return l;
}

-(void) logData
{
    for (int i=0; i<[WordManager sharedWordManager].allWord.count; i++)
    {
        Word* word=[[WordManager sharedWordManager].allWord objectAtIndex:i];
        NSLog(@"%@",word.word);
    }
}

- (NSArray*)getData
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"WordPlist" ofType:@"plist"];
    NSData* data = [NSData dataWithContentsOfFile:plistPath];
    NSError *error;
    NSPropertyListFormat format;
    return  [NSPropertyListSerialization propertyListWithData:data options:0 format:&format error:&error];
}

- (void)setupDatabase
{

    NSArray* array =[self getData];
    
    NSMutableArray* tmpWord=[[NSMutableArray alloc] init];
    
    for (int i=0; i<array.count; i++)
    {
        NSString* wordKey=[[array objectAtIndex:i] objectForKey:@"word"];
        NSString* meaning=[[array objectAtIndex:i] objectForKey:@"meaning"];
        NSString* wordText=[self getWordTextWithoutProperty:wordKey];
        
        Word* newWord = nil;
        int index=[self getWord:wordText indexAtTmpArray:tmpWord];
        if (tmpWord.count>index) newWord=[tmpWord objectAtIndex:index];
        if (newWord==nil || [newWord.word compare:wordText]!=NSOrderedSame )
        {
            newWord=[Word createEntity];
            newWord.word=wordText;
            newWord.meaning=[[NSDictionary alloc] init];
            [tmpWord insertObject:newWord atIndex:index];
        }
        
        NSMutableDictionary* dictionary=[newWord.meaning mutableCopy];
        [dictionary setObject:meaning forKey:wordKey];
        newWord.meaning=[dictionary copy];
    }
    
    [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
}


- (Word*)findWordByCompleteWord:(NSString*)word
{
    for (Word* obj in self.allWord)
    {
        if ([obj.word isEqualToString:word]) return obj;
    }
    return nil;
}

- (NSArray*)findWordContantArrayBySearchText:(NSString*)searchText
{
    if (searchText==nil || [searchText isEqualToString:@""]) return nil;
    searchText=searchText.lowercaseString;
    NSMutableArray* data=[[NSMutableArray alloc] init];
    int l=0;
    int r=(int)self.allWord.count;
    
    while (l<r)
    {
        int mid=(l+r)>>1;
        NSLog(@"%@",((Word*)[self.allWord objectAtIndex:mid]).word );
        NSComparisonResult result=[((Word*)[self.allWord objectAtIndex:mid]).word.lowercaseString compare:searchText];
        if (result==NSOrderedSame)
        {
            l=mid;
            break ;
        }
        else if (result==NSOrderedAscending)
        {
            l=mid+1;
        }
        else r=mid;
    }
    
    while (l>=1)
    {
        NSComparisonResult result=[((Word*)[self.allWord objectAtIndex:l-1]).word.lowercaseString compare:searchText];
        if (result==NSOrderedSame) l--;
        else break ;
    }
    
    for (int i=l; i<MIN(l+25, self.allWord.count); i++)
    {
        [data addObject:((Word*)[self.allWord objectAtIndex:i]).word];
    }
    return data;
}

@end
