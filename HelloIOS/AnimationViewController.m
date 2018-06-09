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
    
    CGFloat rotateAngle;
    CGAffineTransform endAngle;
}

@property (weak, nonatomic) IBOutlet UIView *animView;


@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    verticalFlag = 1;
    horizontalFlag = 1;
    
    [UIView setAnimationCurve:(UIViewAnimationCurveLinear)];
    endAngle = CGAffineTransformMakeRotation(rotateAngle * (M_PI / 180.0f));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moveVertical:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.animView.frame;
        frame.origin.y += 200 * verticalFlag;
        verticalFlag *= -1;
        self.animView.frame = frame;
    }];
}

- (IBAction)moveHorizontal:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.animView.frame;
        frame.origin.x += 200 * horizontalFlag;
        horizontalFlag *= -1;
        self.animView.frame = frame;
    }];
}

- (IBAction)stopAnim:(id)sender {
    [self pauseLayer:self.animView.layer];
}

- (IBAction)resumeAnim:(id)sender {
    [self resumeLayer:self.animView.layer];
}

//暂停动画
- (void)pauseLayer:(CALayer*)layer {
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

//继续layer上面的动画
-(void)resumeLayer:(CALayer*)layer {
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}



@end
