//
//  NSAttributedString+Html2Attributed.m
//  Brain
//
//  Created by 邱峰 on 13-12-13.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import "NSAttributedString+Html2Attributed.h"

@implementation NSAttributedString (Html2Attributed)

+(NSAttributedString*)getAttributeStringFromHtmlString:(NSString*)str
{
    NSMutableString* html=[str mutableCopy];
    
    NSMutableAttributedString* att = [[[NSAttributedString alloc] initWithData:[html dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]} documentAttributes:nil error:nil] mutableCopy];
    
    return att;
}



@end
