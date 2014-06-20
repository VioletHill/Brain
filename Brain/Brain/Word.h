//
//  Word.h
//  Brain
//
//  Created by 邱峰 on 5/10/14.
//  Copyright (c) 2014 邱峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Word : NSManagedObject

@property (nonatomic, retain) id meaning;
@property (nonatomic, retain) id releatedWord;
@property (nonatomic, retain) NSString * word;

@end
