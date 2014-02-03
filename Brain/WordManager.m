//
//  WordManager.m
//  Brain
//
//  Created by 邱峰 on 13-11-5.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import "WordManager.h"

#import "NSString+sortString.h"


@interface WordManager()

//@property (nonatomic,strong) NSArray* allWord;
@property (nonatomic,strong) NSArray* wordA;
@property (nonatomic,strong) NSArray* wordB;
@property (nonatomic,strong) NSArray* wordC;
@property (nonatomic,strong) NSArray* wordD;
@property (nonatomic,strong) NSArray* wordE;
@property (nonatomic,strong) NSArray* wordF;
@property (nonatomic,strong) NSArray* wordG;
@property (nonatomic,strong) NSArray* wordH;
@property (nonatomic,strong) NSArray* wordI;
@property (nonatomic,strong) NSArray* wordJ;
@property (nonatomic,strong) NSArray* wordK;
@property (nonatomic,strong) NSArray* wordL;
@property (nonatomic,strong) NSArray* wordM;
@property (nonatomic,strong) NSArray* wordN;
@property (nonatomic,strong) NSArray* wordO;
@property (nonatomic,strong) NSArray* wordP;
@property (nonatomic,strong) NSArray* wordQ;
@property (nonatomic,strong) NSArray* wordR;
@property (nonatomic,strong) NSArray* wordS;
@property (nonatomic,strong) NSArray* wordT;
@property (nonatomic,strong) NSArray* wordU;
@property (nonatomic,strong) NSArray* wordV;
@property (nonatomic,strong) NSArray* wordW;
@property (nonatomic,strong) NSArray* wordX;
@property (nonatomic,strong) NSArray* wordY;
@property (nonatomic,strong) NSArray* wordZ;
@property (nonatomic,strong) NSArray* wordPrefix;


@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextA;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextB;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextC;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextD;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextE;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextF;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextG;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextH;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextI;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextJ;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextK;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextL;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextM;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextN;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextO;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextP;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextQ;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextR;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextS;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextT;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextU;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextV;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextW;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextX;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextY;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextZ;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContextPrefix;


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


-(NSManagedObjectContext*) managedObjectContextA
{
    if (_managedObjectContextA==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainA" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextA=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextA setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextA;
}


-(NSManagedObjectContext*) managedObjectContextB
{
    if (_managedObjectContextB==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainB" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextB=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextB setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextB;
}

-(NSManagedObjectContext*) managedObjectContextC
{
    if (_managedObjectContextC==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainC" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextC=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextC setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextC;
}



-(NSManagedObjectContext*) managedObjectContextD
{
    if (_managedObjectContextD==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainD" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextD=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextD setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextD;
}

-(NSManagedObjectContext*) managedObjectContextE
{
    if (_managedObjectContextE==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainE" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextE=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextE setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextE;
}

-(NSManagedObjectContext*) managedObjectContextF
{
    if (_managedObjectContextF==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainF" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextF=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextF setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextF;
}

-(NSManagedObjectContext*) managedObjectContextG
{
    if (_managedObjectContextG==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainG" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextG=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextG setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextG;
}

-(NSManagedObjectContext*) managedObjectContextH
{
    if (_managedObjectContextH==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainH" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextH=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextH setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextH;
}

-(NSManagedObjectContext*) managedObjectContextI
{
    if (_managedObjectContextI==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainI" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextI=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextI setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextI;
}

-(NSManagedObjectContext*) managedObjectContextJ
{
    if (_managedObjectContextJ==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainJ" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextJ=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextJ setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextJ;
}

-(NSManagedObjectContext*) managedObjectContextK
{
    if (_managedObjectContextK==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainK" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextK=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextK setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextK;
}

-(NSManagedObjectContext*) managedObjectContextL
{
    if (_managedObjectContextL==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainL" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextL=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextL setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextL;
}

-(NSManagedObjectContext*) managedObjectContextM
{
    if (_managedObjectContextM==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainM" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextM=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextM setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextM;
}

-(NSManagedObjectContext*) managedObjectContextN
{
    if (_managedObjectContextN==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainN" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextN=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextN setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextN;
}

-(NSManagedObjectContext*) managedObjectContextO
{
    if (_managedObjectContextO==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainO" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextO=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextO setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextO;
}

-(NSManagedObjectContext*) managedObjectContextP
{
    if (_managedObjectContextP==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainP" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextP=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextP setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextP;
}

-(NSManagedObjectContext*) managedObjectContextQ
{
    if (_managedObjectContextQ==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainQ" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextQ=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextQ setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextQ;
}


-(NSManagedObjectContext*) managedObjectContextR
{
    if (_managedObjectContextR==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainR" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextR=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextR setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextR;
}

-(NSManagedObjectContext*) managedObjectContextS
{
    if (_managedObjectContextS==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainS" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextS=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextS setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextS;
}

-(NSManagedObjectContext*) managedObjectContextT
{
    if (_managedObjectContextT==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainT" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextT=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextT setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextT;
}

-(NSManagedObjectContext*) managedObjectContextU
{
    if (_managedObjectContextU==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainU" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextU=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextU setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextU;
}

-(NSManagedObjectContext*) managedObjectContextV
{
    if (_managedObjectContextV==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainV" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextV=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextV setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextV;
}

-(NSManagedObjectContext*) managedObjectContextW
{
    if (_managedObjectContextW==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainW" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextW=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextW setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextW;
}

-(NSManagedObjectContext*) managedObjectContextX
{
    if (_managedObjectContextX==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainX" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextX=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextX setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextX;
}

-(NSManagedObjectContext*) managedObjectContextY
{
    if (_managedObjectContextY==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainY" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextY=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextY setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextY;
}

-(NSManagedObjectContext*) managedObjectContextZ
{
    if (_managedObjectContextZ==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainZ" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextZ=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextZ setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextZ;
}

-(NSManagedObjectContext*) managedObjectContextPrefix
{
    if (_managedObjectContextPrefix==nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
        
        NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
        
        NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"BrainPrefix" withExtension:@"sqlite"];
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
        _managedObjectContextPrefix=[[NSManagedObjectContext alloc] init];
        [_managedObjectContextPrefix setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return _managedObjectContextPrefix;
}


-(NSArray*) wordA
{
    if (_wordA==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextA];
        [request setEntity:entity];
        _wordA=[[self.managedObjectContextA executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordA;
}

-(NSArray*) wordB
{
    if (_wordB==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextB];
        [request setEntity:entity];
        _wordB=[[self.managedObjectContextB executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordB;
}

-(NSArray*) wordC
{
    if (_wordC==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextC];
        [request setEntity:entity];
        _wordC=[[self.managedObjectContextC executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordC;
}

-(NSArray*) wordD
{
    if (_wordD==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextD];
        [request setEntity:entity];
        _wordD=[[self.managedObjectContextD executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordD;
}

-(NSArray*) wordE
{
    if (_wordE==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextE];
        [request setEntity:entity];
        _wordE=[[self.managedObjectContextE executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordE;
}

-(NSArray*) wordF
{
    if (_wordF==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextF];
        [request setEntity:entity];
        _wordF=[[self.managedObjectContextF executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordF;
}

-(NSArray*) wordG
{
    if (_wordG==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextG];
        [request setEntity:entity];
        _wordG=[[self.managedObjectContextG executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordG;
}

-(NSArray*) wordH
{
    if (_wordH==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextH];
        [request setEntity:entity];
        _wordH=[[self.managedObjectContextH executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordH;
}

-(NSArray*) wordI
{
    if (_wordI==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextI];
        [request setEntity:entity];
        _wordI=[[self.managedObjectContextI executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordI;
}

-(NSArray*) wordJ
{
    if (_wordJ==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextJ];
        [request setEntity:entity];
        _wordJ=[[self.managedObjectContextJ executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordJ;
}

-(NSArray*) wordK
{
    if (_wordK==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextK];
        [request setEntity:entity];
        _wordK=[[self.managedObjectContextK executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordK;
}

-(NSArray*) wordL
{
    if (_wordL==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextL];
        [request setEntity:entity];
        _wordL=[[self.managedObjectContextL executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordL;
}

-(NSArray*) wordM
{
    if (_wordM==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextM];
        [request setEntity:entity];
        _wordM=[[self.managedObjectContextM executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordM;
}

-(NSArray*) wordN
{
    if (_wordN==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextN];
        [request setEntity:entity];
        _wordN=[[self.managedObjectContextN executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordN;
}

-(NSArray*) wordO
{
    if (_wordO==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextO];
        [request setEntity:entity];
        _wordO=[[self.managedObjectContextO executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordO;
}

-(NSArray*) wordP
{
    if (_wordP==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextP];
        [request setEntity:entity];
        _wordP=[[self.managedObjectContextP executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordP;
}

-(NSArray*) wordQ
{
    if (_wordQ==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextQ];
        [request setEntity:entity];
        _wordQ=[[self.managedObjectContextQ executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordQ;
}

-(NSArray*) wordR
{
    if (_wordR==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextR];
        [request setEntity:entity];
        _wordR=[[self.managedObjectContextR executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordR;
}

-(NSArray*) wordS
{
    if (_wordS==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextS];
        [request setEntity:entity];
        _wordS=[[self.managedObjectContextS executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordS;
}

-(NSArray*) wordT
{
    if (_wordT==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextT];
        [request setEntity:entity];
        _wordT=[[self.managedObjectContextT executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordT;
}

-(NSArray*) wordU
{
    if (_wordU==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextU];
        [request setEntity:entity];
        _wordU=[[self.managedObjectContextU executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordU;
}

-(NSArray*) wordV
{
    if (_wordV==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextV];
        [request setEntity:entity];
        _wordV=[[self.managedObjectContextV executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordV;
}

-(NSArray*) wordW
{
    if (_wordW==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextW];
        [request setEntity:entity];
        _wordW=[[self.managedObjectContextW executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordW;
}

-(NSArray*) wordX
{
    if (_wordX==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextX];
        [request setEntity:entity];
        _wordX=[[self.managedObjectContextX executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordX;
}

-(NSArray*) wordY
{
    if (_wordY==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextY];
        [request setEntity:entity];
        _wordY=[[self.managedObjectContextY executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordY;
}

-(NSArray*) wordZ
{
    if (_wordZ==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextZ];
        [request setEntity:entity];
        _wordZ=[[self.managedObjectContextZ executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
            NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
            if (result==NSOrderedSame)
            {
                return [a.word compare:b.word];
            }
            else return result;
        }];
        
    }
    return _wordZ;
}

-(NSArray*) wordPrefix
{
    if (_wordPrefix==nil)
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: self.managedObjectContextPrefix];
        [request setEntity:entity];
        _wordPrefix=[[self.managedObjectContextPrefix executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
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


//-(void) getAllWord
//{
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Word" withExtension:@"momd"];
//    
//    NSManagedObjectModel* managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
//    NSPersistentStoreCoordinator* persistentStoreCoordinator= [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedOjectModel];
//    
//    NSURL* sqlite=[[NSBundle mainBundle] URLForResource:@"Brain" withExtension:@"sqlite"];
//    [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlite options:nil error:nil];
//    _managedObjectContext=[[NSManagedObjectContext alloc] init];
//    [_managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
//
//    NSFetchRequest *request=[[NSFetchRequest alloc] init];
//    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Word" inManagedObjectContext: _managedObjectContext];
//    [request setEntity:entity];
//    
//    self.allWord=[[_managedObjectContext executeFetchRequest:request error:nil] sortedArrayUsingComparator:^NSComparisonResult(Word* a,Word* b){
//        NSComparisonResult result=[[a.word getSortString] compare:[b.word getSortString]];
//        if (result==NSOrderedSame)
//        {
//            return [a.word compare:b.word];
//        }
//        else return result;
//    }];
//    [self getPrefixWord];
//}
//
//-(void) getPrefixWord
//{
//    NSMutableArray* arr=[[NSMutableArray alloc] init];
//    for (int i=0; i<self.allWord.count; i++)
//    {
//        if ([[[self.allWord objectAtIndex:i] word] characterAtIndex:0]=='-')
//        {
//            [arr addObject:[self.allWord objectAtIndex:i]];
//        }
//    }
//    self.prefixWord=[arr copy];
//}
//
//
//- (BOOL) isDatabaseEmpty
//{
//    if ([Word findFirst]==nil)
//    {
//        return YES;
//    }
//    return NO;
//}
//
//
//-(void)getAllWordFromPlist
//{
//    self.allWord=[[self getData] sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(Word* a,Word* b){
//        return [a.word.lowercaseString compare:b.word.lowercaseString];
//    }];
//}


-(void)preparedWord
{
    [self wordP];
    [self wordS];
    [self wordT];
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

//-(void) logData
//{
//    for (int i=0; i<[WordManager sharedWordManager].allWord.count; i++)
//    {
//        Word* word=[[WordManager sharedWordManager].allWord objectAtIndex:i];
//        NSLog(@"%@",word.word);
//    }
//}
//
//- (NSArray*)getData
//{
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"WordPlist" ofType:@"plist"];
//    NSData* data = [NSData dataWithContentsOfFile:plistPath];
//    NSError *error;
//    NSPropertyListFormat format;
//    return  [NSPropertyListSerialization propertyListWithData:data options:0 format:&format error:&error];
//}
//
//- (void)setupDatabase
//{
//
//    NSArray* array =[self getData];
//    
//    NSMutableArray* tmpWord=[[NSMutableArray alloc] init];
//    
//    for (int i=0; i<array.count; i++)
//    {
//        NSString* wordKey=[[array objectAtIndex:i] objectForKey:@"word"];
//        NSString* meaning=[[array objectAtIndex:i] objectForKey:@"meaning"];
//        NSString* wordText=[self getWordTextWithoutProperty:wordKey];
//        
//        BOOL isNeedContine=YES;
//        char ch=[wordKey characterAtIndex:0];
////        if (ch=='-') ch=[wordKey characterAtIndex:1];
////        
////        if (ch=='z' || ch=='Z') isNeedContine=NO;
//        if (ch=='-') isNeedContine=NO;
//        if (isNeedContine) continue;
//        
//        Word* newWord = nil;
//        int index=[self getWord:wordText indexAtTmpArray:tmpWord];
//        if (tmpWord.count>index) newWord=[tmpWord objectAtIndex:index];
//        if (newWord==nil || [newWord.word compare:wordText]!=NSOrderedSame )
//        {
//            newWord=[Word createEntity];
//            newWord.word=wordText;
//            newWord.meaning=[[NSDictionary alloc] init];
//            [tmpWord insertObject:newWord atIndex:index];
//        }
//        
//        NSMutableDictionary* dictionary=[newWord.meaning mutableCopy];
//        [dictionary setObject:meaning forKey:wordKey];
//        newWord.meaning=[dictionary copy];
//    }
//    
//    [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
//}
//

-(NSArray*) getSearchArrayByWord:(NSString*)word
{
    char ch=[word.lowercaseString characterAtIndex:0];
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
    if (word==nil || [word isEqualToString:@""]) return nil;
    for (Word* obj in [self getSearchArrayByWord:word])
    {
        if ([obj.word isEqualToString:word]) return obj;
    }
    return nil;
}

- (NSArray*)findWordContantArrayBySearchText:(NSString*)searchText
{
    if (searchText==nil || [searchText isEqualToString:@""]) return nil;
    searchText=searchText.lowercaseString;
    
    NSArray* searchArray=[self getSearchArrayByWord:searchText];
    
    NSMutableArray* data=[[NSMutableArray alloc] init];
    int l=0;
    int r=(int)searchArray.count;
    
    while (l<r)
    {
        int mid=(l+r)>>1;
        NSString* a=[((Word*)[searchArray objectAtIndex:mid]).word getSortString];
        NSComparisonResult result=[a compare:[searchText getSortString]];
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
    
    //单词有重复的 比如 china 和 China
    while (l>=1)
    {
        NSComparisonResult result=[[((Word*)[searchArray objectAtIndex:l-1]).word getSortString] compare:[searchText getSortString]];
        if (result==NSOrderedSame) l--;
        else break ;
    }
    
    for (int i=l; i<MIN(l+25, searchArray.count); i++)
    {
        [data addObject:((Word*)[searchArray objectAtIndex:i]).word];
    }
    return data;
}

@end
