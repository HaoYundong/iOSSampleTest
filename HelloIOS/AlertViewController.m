//
//  AlertViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/1/24.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

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

- (IBAction) alertMsg:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"提示"
                          message:@"您确定要执行操作吗？"
                          delegate:nil
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:@"取消", nil];
    [alert show];
}

- (IBAction) alert_UIAlertController {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"iOS9新式弹窗" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击确认");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"警告" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击警告");
    }]];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSLog(@"添加一个textField就会调用 这个block");
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction) alert_UIAlertController_ActionSheetStyle {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"iOS9新式弹窗:将AlertView与ActionSheet合二为一" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击确认");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"警告" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击警告");
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
