//
//  AboutLiuViewController.m
//  Brain
//
//  Created by 邱峰 on 13-11-20.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import "AboutLiuViewController.h"

@interface AboutLiuViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) NSString* detailStr;

@end

@implementation AboutLiuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSString*) detailStr
{
    if (_detailStr==nil)
    {
        _detailStr=@"<div><p>  嗯，这个“培根” App是由我个人构思设计、获得版权、找到邱峰与我合作开发的，并且我也负责了App的推广和运营工作。作为一名即将应届毕业的医学生，我正在寻求互联网行业内的一份产品策划/运营类工作。除了自己的简历之外，我想，这个App也能在某种程度上证明我对互联网产品的理解。<br>如果您，您所认识的朋友可以提供这样的工作机会（或者您有其他有价值的信息），敬请联系我：chaceliu@gmail.com <br>微博：www.weibo.com/liuchongwei</p><div>";
    }
    return _detailStr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.webView loadHTMLString:self.detailStr baseURL:nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
