//
//  SimpleCustomView.m
//  HelloIOS
//
//  Created by haoyundong on 2018/2/6.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "SimpleCustomView.h"

@implementation SimpleCustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor greenColor];
}

@end
