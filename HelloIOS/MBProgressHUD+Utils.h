//
//  MBProgressHUD+Utils.h
//  HelloIOS
//
//  Created by haoyundong on 2018/4/17.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface MBProgressHUD (Utils)

+ (MBProgressHUD *)showLoadingMsg:(NSString *)msg;

+ (MBProgressHUD *)showLoadingMsg:(NSString *)msg inView:(UIView *)view;

+ (MBProgressHUD *)showFleetingMsg:(NSString *)msg;

+ (MBProgressHUD *)showFleetingMsg:(NSString *)msg img:(UIImage *)img;

- (void)showLoadingMsg:(NSString *)msg inView:(UIView *)view;

- (void)showFleetingMsg:(NSString *)msg;

- (void)showFleetingMsg:(NSString *)msg img:(UIImage *)img;

@end
