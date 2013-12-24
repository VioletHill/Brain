//
//  Word.h
//  Brain
//
//  Created by 邱峰 on 13-12-17.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Word : NSManagedObject

@property (nonatomic, retain) NSDictionary* meaning;
@property (nonatomic, retain) NSString * word;

@end
