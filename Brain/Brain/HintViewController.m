//
//  HintViewController.m
//  Brain
//
//  Created by 邱峰 on 14-2-23.
//  Copyright (c) 2014年 邱峰. All rights reserved.
//

#import "HintViewController.h"

@interface HintViewController ()

@end

@implementation HintViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithHtmlFile:(NSString*)html
{
    if (self = [super init]) {
        NSLog(@"%f %f", self.view.frame.origin.y, self.view.frame.size.height);
        NSString* filePath = [[NSBundle mainBundle] pathForResource:html ofType:@"html"];
        NSURL* url = [NSURL fileURLWithPath:filePath];
        NSURLRequest* request = [NSURLRequest requestWithURL:url];

        UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.frame];
        [webView loadRequest:request];
        [self.view addSubview:webView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:251.0 / 255.0 green:240.0 / 255.0 blue:217.0 / 255.0 alpha:1.0];
    self.title = @"Hint";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
