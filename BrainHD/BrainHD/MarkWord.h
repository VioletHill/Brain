//
//  MarkWord.h
//  BrainHD
//
//  Created by 邱峰 on 7/23/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MarkWord : NSManagedObject

@property (nonatomic, retain) NSNumber * isMark;
@property (nonatomic, retain) NSString * word;

@end
