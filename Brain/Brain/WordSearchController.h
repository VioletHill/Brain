//
//  ViewController.h
//  Brain
//
//  Created by 邱峰 on 13-11-3.
//  Copyright (c) 2013年 邱峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordSearchController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar* searchBar;

@end
