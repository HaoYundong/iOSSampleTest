//
//  WebListTableViewCell.h
//  HelloIOS
//
//  Created by haoyundong on 2018/6/8.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebListTableViewCell : UITableViewCell<UIWebViewDelegate>

@property (nonatomic,strong) NSString *contentStr;
@property (nonatomic,assign) CGFloat height;
@property (strong, nonatomic) UIWebView *webView;

+ (NSString *)getIdentifier;

@end
