//
//  NSAttributedString+Html2Attributed.m
//  Brain
//
//  Created by 邱峰 on 13-12-13.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import "NSAttributedString+Html2Attributed.h"

@implementation NSAttributedString (Html2Attributed)

+ (NSAttributedString*)getAttributeStringFromHtmlString:(NSString*)str
{
    NSMutableString* html = [str mutableCopy];
    NSLog(@"%@",html);
    NSDictionary* attrDictionary = @{
        NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
        NSCharacterEncodingDocumentAttribute : [NSNumber numberWithInt:NSUTF8StringEncoding]
    };
    NSMutableAttributedString* att = [[[NSAttributedString alloc] initWithData:[html dataUsingEncoding:NSUTF8StringEncoding] options:attrDictionary documentAttributes:nil error:nil] mutableCopy];

    return att;
}

@end
