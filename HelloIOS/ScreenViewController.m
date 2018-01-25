//
//  ScreenViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/1/24.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "ScreenViewController.h"

@interface ScreenViewController ()
@property (weak, nonatomic) IBOutlet UILabel *screenDirection;

@end

@implementation ScreenViewController

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

/*
 屏幕旋转前事件触发
 */
- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        _screenDirection.text = @"垂直向上";
    } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
        _screenDirection.text = @"水平向右";
    }
}

@end
