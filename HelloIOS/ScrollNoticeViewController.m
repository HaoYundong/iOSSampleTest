//
//  ScrollNoticeViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/3/8.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "ScrollNoticeViewController.h"
#import "LMJScrollTextView2.h"

@interface ScrollNoticeViewController () <LMJScrollTextView2Delegate>{
    LMJScrollTextView2 * _scrollTextView;
}
@end

@implementation ScrollNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self setupData];
}

- (void)setupView {
    _scrollTextView = [[LMJScrollTextView2 alloc] initWithFrame:CGRectMake(ScreenWidth / 2 - 100, 100, 200, 50)];
    _scrollTextView.delegate        = self;
    _scrollTextView.backgroundColor = [UIColor grayColor];
    _scrollTextView.textColor       = [UIColor greenColor];
    _scrollTextView.textFont        = [UIFont systemFontOfSize:15.f];
    _scrollTextView.textAlignment   = NSTextAlignmentCenter;
    _scrollTextView.touchEnable     = YES;
    [self.view addSubview:_scrollTextView];
}

- (void)setupData {
    _scrollTextView.textDataArr = @[@"第0条数据",@"第1条数据",@"第2条数据",@"第3条数据"];
    [_scrollTextView startScrollBottomToTopWithNoSpace];
}


#pragma mark - LMJScrollTextView2 Delegate
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView currentTextIndex:(NSInteger)index{
    NSLog(@"当前是信息%ld",index);
}
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView clickIndex:(NSInteger)index content:(NSString *)content{
    NSLog(@"#####点击的是：第%ld条信息 内容：%@",index,content);
}


@end
