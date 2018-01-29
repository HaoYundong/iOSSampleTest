//
//  EventCollectionViewCell.m
//  HelloIOS
//
//  Created by haoyundong on 2018/1/29.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "EventCollectionViewCell.h"

@implementation EventCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat cellWith = self.frame.size.width;
        
        CGFloat imageWidth = 101;
        CGFloat imageHeight = 101;
        CGFloat imageTopView = 15;
        
        // 添加imageView
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((cellWith - imageWidth) / 2, imageTopView, imageWidth, imageHeight)];
        [self addSubview:_imageView];
        
        // 添加标签
        CGFloat labelWidth = 101;
        CGFloat labelHeight = 16;
        CGFloat labelTopView = 15;
        _label = [[UILabel alloc] initWithFrame:CGRectMake((cellWith - labelWidth) / 2, labelTopView, labelWidth, labelHeight)];
        _label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:13];
        [self addSubview:_label];
    }
    
    return self;
}

@end
