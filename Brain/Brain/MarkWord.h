//
//  MarkWord.h
//  Brain
//
//  Created by 邱峰 on 6/25/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MarkWord : NSManagedObject

@property (nonatomic, retain) NSNumber * isMark;
@property (nonatomic, retain) NSString * word;

@end
