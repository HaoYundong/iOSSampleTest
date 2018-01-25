//
//  TimerViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/1/24.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (assign, nonatomic)BOOL isStarted;

@property (weak, nonatomic) NSTimer *timer;
@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doProgress:(id)sender {
    self.progressView.progress = 0.0;
    self.timer = [NSTimer
             scheduledTimerWithTimeInterval:1.0
             target:self
             selector:@selector(timerWork)
             userInfo:nil
             repeats:YES];
}

- (void)timerWork {
    self.progressView.progress = self.progressView.progress + 0.1;
    if(self.progressView.progress == 1.0) {
        [self.timer invalidate];
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"提示"
                              message:@"硬盘格式化完成"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}



@end
