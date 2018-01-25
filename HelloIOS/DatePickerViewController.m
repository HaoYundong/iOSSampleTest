//
//  DatePickerViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/1/25.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateTimeView;
@property (weak, nonatomic) IBOutlet UIDatePicker *DateView;
@property (weak, nonatomic) IBOutlet UIDatePicker *TimeView;
@property (weak, nonatomic) IBOutlet UIButton *currentTimeShow;


@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
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
- (void)setupUI {
}

- (IBAction)updaDateOrTime:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:_dateTimeView.date];
    [_currentTimeShow setTitle:strDate forState:UIControlStateNormal];
}

@end
