//
//  AbbreviationViewController.m
//  Brain
//
//  Created by 邱峰 on 14-1-29.
//  Copyright (c) 2014年 邱峰. All rights reserved.
//

#import "AbbreviationViewController.h"

@interface AbbreviationViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation AbbreviationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    NSString* filePath=[[NSBundle mainBundle] pathForResource:@"Abbreviation" ofType:@"html"];
    NSURL* url=[NSURL fileURLWithPath:filePath];
    NSURLRequest* request=[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
