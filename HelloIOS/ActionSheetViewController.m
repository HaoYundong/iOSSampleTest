//
//  ActionSheetViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/1/24.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "ActionSheetViewController.h"
#import "RedViewController.h"
#import "TableViewController.h"
#import "NaviTableViewController.h"
#import "RootViewController.h"

@interface ActionSheetViewController ()<UIActionSheetDelegate>

@end

@implementation ActionSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// 页面跳转控制
- (IBAction) actionSheetTest:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"请选择您的跳转操作~"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"TabController"
                                  otherButtonTitles:@"TableView", @"AutoLayout", @"NaviTest", nil];
    
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:{
            RedViewController *rvc = [[RedViewController alloc] init];
            [self presentModalViewController:rvc animated:YES];
            break;
        }
        case 1:{
            TableViewController *tvc = [[TableViewController alloc] init];
            [self presentModalViewController:tvc animated:YES];
            break;
        }
        case 2:{
            //            AutoLayoutController *alc = [[AutoLayoutController alloc] init];
            //            [self presentModalViewController:alc animated:YES];
            break;
        }
        case 3:{
            RootViewController *rvc = [[RootViewController alloc] init];
            [self presentModalViewController:rvc animated:YES];
            break;
        }
        case 4:{
            
            break;
        }
        default:
            NSLog(@"您点击了其它按钮");
            break;
    }
}

@end
