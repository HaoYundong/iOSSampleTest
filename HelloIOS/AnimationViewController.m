//
//  AnimationViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/4/18.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

/*
 有以下动画方式:
 1. 移动
 */

#import "AnimationViewController.h"

@interface AnimationViewController () {
    int verticalFlag;
    int horizontalFlag;
}

@property (weak, nonatomic) IBOutlet UIView *animView;


@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    verticalFlag = 1;
    horizontalFlag = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moveVertical:(id)sender {
    [UIView animateWithDuration:2 animations:^{
        CGRect frame = self.animView.frame;
        frame.origin.y += 200 * verticalFlag;
        verticalFlag *= -1;
        self.animView.frame = frame;
    }];
}

- (IBAction)moveHorizontal:(id)sender {
    [UIView animateWithDuration:2 animations:^{
        CGRect frame = self.animView.frame;
        frame.origin.x += 200 * horizontalFlag;
        horizontalFlag *= -1;
        self.animView.frame = frame;
    }];
}

//- (IBAction)moveVertical:(id)sender {
//
//}
//
//- (IBAction)moveVertical:(id)sender {
//
//}



@end
