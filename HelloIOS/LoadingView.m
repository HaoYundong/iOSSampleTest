//
//  LoadingView.m
//  HelloIOS
//
//  Created by haoyundong on 2018/4/17.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView ()
@property(nonatomic, strong) UIImageView *imageView;
@end


@implementation LoadingView

- (void)dealloc {
    [self.imageView stopAnimating];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.imageView = [[UIImageView alloc] init];
        
        NSMutableArray *images = [NSMutableArray arrayWithCapacity:8];
        for (int i = 1; i <= 8; i++) {
            [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"Loading%d", i]]];
        }
        self.imageView.animationImages = images;
        self.imageView.animationDuration = images.count * 3.1 / 30;
        [self.imageView startAnimating];
        
        [self addSubview:self.imageView];
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.numberOfLines = 3;
        self.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        self.titleLabel.textColor = [UIColor lightGrayColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self addSubview:self.titleLabel];
        
        
        [self installContraints];
    }
    return self;
}

- (void)updateConstraints {
    [self installContraints];
    [super updateConstraints];
}

- (void)installContraints {
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(-32);
        make.right.equalTo(self.titleLabel.mas_left).offset(-5);
    }];

    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.imageView);
    }];
    
}

@end

