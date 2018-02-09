//
//  SimpleCustomViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/2/5.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "SimpleCustomViewController.h"
#import "SimpleCustomView.h"
#import "UIView+NibLoading.h"
#import "ComtomWithNibView.h"


@interface SimpleCustomViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UIView *sysView;
@property (strong, nonatomic) IBOutlet UIView *simpleCustomView;
@property (strong, nonatomic) IBOutlet ComtomWithNibView *nibView;


@end

@implementation SimpleCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    [self setupSystemUIView];
    [self setupSimpleCustomView];
    [self setupNibView];
    [self setupRelatedToCustomView];
}

- (void)setupSystemUIView {
    _sysView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    _sysView.backgroundColor = [UIColor redColor];
    [_containerView addSubview:_sysView];
}

- (void)setupSimpleCustomView {
    _simpleCustomView = [[SimpleCustomView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 100)];
    [_containerView addSubview:_simpleCustomView];
}

- (void)setupNibView {
    _nibView = [ComtomWithNibView loadInstanceFromNib];
    _nibView.frame = CGRectMake(0, 200, ScreenWidth, 150);
    [_containerView addSubview:_nibView];
}

- (void)setupRelatedToCustomView {
    
}

@end
