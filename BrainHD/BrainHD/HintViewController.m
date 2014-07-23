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

@implementation HintViewController {
    UIWebView* webView;
}

- (instancetype)initWithHtmlFile:(NSString*)html
{
    if (self = [super init]) {
        NSString* filePath = [[NSBundle mainBundle] pathForResource:html ofType:@"html"];
        NSURL* url = [NSURL fileURLWithPath:filePath];
        NSURLRequest* request = [NSURLRequest requestWithURL:url];

        CGRect rect = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width - 320, self.view.frame.size.height);
        webView = [[UIWebView alloc] initWithFrame:rect];
        [webView loadRequest:request];
        [self.view addSubview:webView];
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

- (void)viewWillAppear:(BOOL)animated
{
    webView.frame = self.view.frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UIDeviceOrientationIsLandscape(toInterfaceOrientation)) {
        webView.frame = CGRectMake(0, 0, 1024 - 320, 768);
    } else {
        webView.frame = CGRectMake(0, 0, 768 - 320, 1024);
    }
}

@end
