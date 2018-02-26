//
//  ShapeManager.m
//  HelloIOS
//
//  Created by haoyundong on 2018/2/26.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "ShapeManager.h"

@implementation ShapeManager

+ (void)setViewBorderShape:(UIView *)view : (UIColor *)borderColor : (CGFloat)radius {
    if (view == nil) {
        return;
    }
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    borderLayer.lineWidth = 1.f;
    borderLayer.strokeColor = borderColor.CGColor;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) cornerRadius:radius];
    maskLayer.path = bezierPath.CGPath;
    borderLayer.path = bezierPath.CGPath;
    
    [view.layer insertSublayer:borderLayer atIndex:0];
    [view.layer setMask:maskLayer];
}

+ (void)setViewShapeBackground:(UIView *)view : (UIColor *)bgColor : (CGFloat)radius {
    if (view == nil) {
        return;
    }
    
    view.backgroundColor = bgColor;
    
    UIBezierPath *maskPath = nil;
//    maskPath =  [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
    maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:radius];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
    view.layer.masksToBounds = YES;
}

@end
