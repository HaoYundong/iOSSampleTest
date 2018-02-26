//
//  ShapeSampleViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/2/26.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "ShapeSampleViewController.h"
#import "ShapeManager.h"

@interface ShapeSampleViewController ()

@property (weak, nonatomic) IBOutlet UIButton *boderColorView;
@property (weak, nonatomic) IBOutlet UIButton *shapeBgColorView;


@end

@implementation ShapeSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews {
    [ShapeManager setViewBorderShape:self.boderColorView :[UIColor redColor] :4];
    [ShapeManager setViewShapeBackground:self.shapeBgColorView :[UIColor redColor] :4];
}

@end
