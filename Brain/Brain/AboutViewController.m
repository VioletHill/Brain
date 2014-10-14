//
//  AboutViewController.m
//  Brain
//
//  Created by 邱峰 on 14-1-29.
//  Copyright (c) 2014年 邱峰. All rights reserved.
//

#import "AboutViewController.h"
#import <MessageUI/MessageUI.h>
#import "AppInfo.h"

@interface AboutViewController () <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel* versionNo;

@end

@implementation AboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)setVersionNo:(UILabel*)versionNo
{
    if (_versionNo == nil) {
        _versionNo = versionNo;
        _versionNo.text = [NSString stringWithFormat:@"Version %@", [AppInfo appVersion]];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return [super numberOfSectionsInTableView:tableView];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [super tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    // Configure the cell...

    return cell;
}

#define EVALUTE_SECTIION 2
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.section == EVALUTE_SECTIION) {
        if (indexPath.row == 0) {
            [self evaluate];
        } else if (indexPath.row == 1) {
            [self gotoSuggestion];
        }
    }
}

- (void)tableView:(UITableView*)tableView didHighlightRowAtIndexPath:(NSIndexPath*)indexPath
{
    //[super tableView:tableView didUnhighlightRowAtIndexPath:indexPath];
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
}

- (void)tableView:(UITableView*)tableView didUnhighlightRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - suggestion and rate

- (void)gotoSuggestion
{
    [self sendEmail];
}

- (void)sendEmail
{
    MFMailComposeViewController* mail = [[MFMailComposeViewController alloc] init];
    mail.mailComposeDelegate = (id)self;

    if ([MFMailComposeViewController canSendMail]) {
        //设置收件人
        [mail setToRecipients:@[ @"peigencihui@gmail.com" ]];

        //设置抄送人
        //[mail setCcRecipients:ccAddress];
        //设置邮件内容
        [mail setMessageBody:@"请在分割线下面写下您的建议，或者遇到的问题，帮助我们让\"培根词汇\"更加完美，更加符合您的习惯\n-------------------------------------------\n" isHTML:NO];

        //设置邮件主题
        [mail setSubject:@"培根词汇建议"];

        [self presentViewController:mail animated:YES completion:nil];
    } else {
        [self sendEmailFail:@"您的设备不支持邮件发送，检查是否设置了邮件账户。如果一切正常，建议您更新设备"];
    }
}

- (void)sendEmailFail:(NSString*)errorMessage
{
    if (errorMessage == nil) {
        errorMessage = @"对不起，邮件发送失败，检查网络或者您的设备是否正常";
    }
    UIAlertView* view = [[UIAlertView alloc] initWithTitle:@"发送失败" message:errorMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [view show];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"谢谢您的参与" message:@"再次感谢您为我们提出的意见，我们会尽早处理您的反馈" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    switch (result) {
    case MFMailComposeResultCancelled:
        NSLog(@"取消发送mail");
        break;
    case MFMailComposeResultSaved:
        NSLog(@"保存邮件");
        break;
    case MFMailComposeResultSent:
        NSLog(@"发送邮件");
        [alert show];
        break;
    case MFMailComposeResultFailed:
        NSLog(@"邮件发送失败: %@...", [error localizedDescription]);
        [self sendEmailFail:nil];
        break;
    default:
        break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)evaluate
{
    NSString* str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", @"813629612"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

@end
