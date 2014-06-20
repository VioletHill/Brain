//
//  AppDelegate.m
//  BrainDatabase
//
//  Created by 邱峰 on 14-2-23.
//  Copyright (c) 2014年 邱峰. All rights reserved.
//

#import "AppDelegate.h"
#import "WordEntity.h"

@implementation AppDelegate
{
    NSMutableArray* tmpWord;
    NSArray* array;
}

- (NSArray*)getData
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"WordPlist" ofType:@"plist"];
    NSData* data = [NSData dataWithContentsOfFile:plistPath];
    NSError *error;
    NSPropertyListFormat format;
    return  [NSPropertyListSerialization propertyListWithData:data options:0 format:&format error:&error];
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

- (void)setupDatabase
{
    BOOL isPrefix;
    array =[[self getData] copy];

    tmpWord=[[NSMutableArray alloc] init];
    for (int i=0; i<array.count; i++)
    {
        NSString* wordKey=[[array objectAtIndex:i] objectForKey:@"word"];
        NSString* meaning=[[array objectAtIndex:i] objectForKey:@"meaning"];
        NSString* wordText=[self getWordTextWithoutProperty:wordKey];
        
        char ch=[wordKey characterAtIndex:0];
        if (ch=='-')
        {
            isPrefix=YES;
            ch=[wordKey characterAtIndex:1];
        }
        else
        {
            isPrefix=NO;
        }
        
        if (ch>='A' && ch<='Z') ch=ch-'A'+'a';
        
        Word* newWord=nil;
        Word* prefixWord=nil;
        
        int index=[self getWord:wordText indexAtTmpArray:tmpWord];
        if (tmpWord.count>index) newWord=[tmpWord objectAtIndex:index];
        
        if (newWord==nil || [newWord.word compare:wordText]!=NSOrderedSame )
        {
            switch (ch) {
                case 'a':
                    newWord=[WordA createEntity];
                    break;
                case 'b':
                    newWord=[WordB createEntity];
                    break;
                case 'c':
                    newWord=[WordC createEntity];
                    break;
                case 'd':
                    newWord=[WordD createEntity];
                    break;
                case 'e':
                    newWord=[WordE createEntity];
                    break;
                case 'f':
                    newWord=[WordF createEntity];
                    break;
                case 'g':
                    newWord=[WordG createEntity];
                    break;
                case 'h':
                    newWord=[WordH createEntity];
                    break;
                case 'i':
                    newWord=[WordI createEntity];
                    break;
                case 'j':
                    newWord=[WordJ createEntity];
                    break;
                case 'k':
                    newWord=[WordK createEntity];
                    break;
                case 'l':
                    newWord=[WordL createEntity];
                    break;
                case 'm':
                    newWord=[WordM createEntity];
                    break;
                case 'n':
                    newWord=[WordN createEntity];
                    break;
                case 'o':
                    newWord=[WordO createEntity];
                    break;
                case 'p':
                    newWord=[WordP createEntity];
                    break;
                case 'q':
                    newWord=[WordQ createEntity];
                    break;
                case 'r':
                    newWord=[WordR createEntity];
                    break;
                case 's':
                    newWord=[WordS createEntity];
                    break;
                case 't':
                    newWord=[WordT createEntity];
                    break;
                case 'u':
                    newWord=[WordU createEntity];
                    break;
                case 'v':
                    newWord=[WordV createEntity];
                    break;
                case 'w':
                    newWord=[WordW createEntity];
                    break;
                case 'x':
                    newWord=[WordX createEntity];
                    break;
                case 'y':
                    newWord=[WordY createEntity];
                    break;
                case 'z':
                    newWord=[WordZ createEntity];
                    break;
                default:
                    break;
            }

            newWord.word=wordText;
            newWord.meaning=[[NSDictionary alloc] init];
            [tmpWord insertObject:newWord atIndex:index];
            
            if (isPrefix)
            {
                prefixWord=[WordPrefix createEntity];
                prefixWord.word=wordText;
                prefixWord.meaning=[[NSDictionary alloc] init];
            }
        }
        
        NSMutableDictionary* dictionary=[newWord.meaning mutableCopy];
        [dictionary setObject:meaning forKey:wordKey];
        newWord.meaning=[dictionary copy];
        
        if (isPrefix)
        {
            NSMutableDictionary* dictionary=[newWord.meaning mutableCopy];
            [dictionary setObject:meaning forKey:wordKey];
            prefixWord.meaning=[dictionary copy];
        }
        
    }
   // [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
    [[NSManagedObjectContext defaultContext] save];
    NSLog(@"%d",[WordS findAll].count);
    NSLog(@"%d",[WordPrefix findAll].count);
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
//    [MagicalRecord setupCoreDataStack];
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Brain.sqlite"];
   // [self setupDatabase];
    NSArray* array=[Word findAll];
    NSLog(@"%d",array.count);
    [MagicalRecord cleanUp];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end