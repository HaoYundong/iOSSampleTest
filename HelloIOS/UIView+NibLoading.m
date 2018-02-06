//
//  UIView+NibLoading.m
//  HelloIOS
//
//  Created by haoyundong on 2018/2/6.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "UIView+NibLoading.h"

@implementation UIView (NibLoading)

+(instancetype)loadInstanceFromNib {
    UIView *result = nil;
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    for (id obj in elements) {
        if ([obj isKindOfClass:[self class]]) {
            result = obj;
            break;
        }
    }
    return result;
}

@end
