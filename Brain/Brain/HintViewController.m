//
//  HintViewController.m
//  Brain
//
//  Created by 邱峰 on 14-2-23.
//  Copyright (c) 2014年 邱峰. All rights reserved.
//

#import "HintViewController.h"
#import "UIColor+AppColor.h"

@interface HintViewController ()

@end

@implementation HintViewController

- (instancetype)initWithHtmlFile:(NSString*)html
{
    if (self = [super init]) {
        NSString* filePath = [[NSBundle mainBundle] pathForResource:html ofType:@"html"];
        NSURL* url = [NSURL fileURLWithPath:filePath];
        NSURLRequest* request = [NSURLRequest requestWithURL:url];

        UIWebView* webView = [[UIWebView alloc] init];
        [self.view addSubview:webView];
        webView.translatesAutoresizingMaskIntoConstraints = NO;
        NSDictionary* dictionaryView = NSDictionaryOfVariableBindings(webView);

        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[webView]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:dictionaryView]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[webView]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:dictionaryView]];
        
        [webView loadRequest:request];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor meaningViewBackgroundColor];
    self.title = @"Hint";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
