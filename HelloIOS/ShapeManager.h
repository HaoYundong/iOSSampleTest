//
//  ShapeManager.h
//  HelloIOS
//
//  Created by haoyundong on 2018/2/26.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShapeManager : NSObject

+ (void)setViewBorderShape:(UIView *)view : (UIColor *)borderColor : (CGFloat)radius;

+ (void)setViewShapeBackground:(UIView *)view : (UIColor *)bgColor : (CGFloat)radius;

@end
