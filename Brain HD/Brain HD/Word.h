//
//  Word.h
//  Brain HD
//
//  Created by 邱峰 on 14-3-1.
//  Copyright (c) 2014年 邱峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Word : NSManagedObject

@property (nonatomic, retain) id meaning;
@property (nonatomic, retain) NSString * word;

@end
