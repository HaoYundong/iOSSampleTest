//
//  WebviewListTableViewCell.m
//  HelloIOS
//
//  Created by haoyundong on 2018/6/7.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "WebviewListTableViewCell.h"
#import "WrapContentWebView.h"

@interface WebviewListTableViewCell()

@property (weak, nonatomic) IBOutlet UIWebView *webview;


@end

@implementation WebviewListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self bindData];
}

#pragma mark - public method

- (void)bindData {
    [self.webview loadHTMLString:[self getHtmlData] baseURL:nil];
}

+ (NSString *)getIdentifier {
    return @"WebviewListTableViewCell";
}

- (NSString *)getHtmlData {
    NSString *aa = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",
                    @"<!DOCTYPE html>",
                    @"<html lang=\"en\">",
                    @"<head>",
                    @"<meta charset=\"UTF-8\">",
                    @"<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">",
                    @"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">",
                    @"<title></title>",
                    @"<style>",
                    @"* {",
                    @"margin: 0;",
                    @"padding: 0;",
                    @"box-sizing: border-box;}",
                    @"body {",
                    @"-webkit-font-smoothing: antialiased;",
                    @"font-family: \"Helvetica Neue\", Helvetica, \"PingFang SC\", \"Hiragino Sans GB\", \"Microsoft YaHei\", \"微软雅黑\", Arial, sans-serif;",
                    @"font-size: 16px;}",
                    @".container {",
                    @"padding-bottom: 10px;}",
                    @".list {color: #33c298;padding: 0 10px;font-size: 14px;}",
                    @".dot {color: #d8d8d8;}",
                    @"</style> </head><body>",
                    @"<div class=\"container\">",
                    @"<div style=\"height: 40px; line-height: 40px; border-bottom: 1px solid #eee; color: #333; padding: 0 10px;\">没有找到相关信息哦~</div>",
                    @"<div style=\"color: #333; margin: 10px 0 7px 0; padding: 0 10px;\">您可以尝试以下方法</div>",
                    @"<div class=\"list\"><div><span class=\"dot\">●</span>&nbsp;尽量使用普通话</div><div><span class=\"dot\">●</span>&nbsp;每次说出一个商品信息</div><div><span class=\"dot\">●</span>&nbsp;点击下方键盘，使用文字输入</div></div>",
                    @"<img src=\"http://img.ishequ360.com/images/zg/supply/v2/sesame_120@2x.png\" alt=\"\" style=\"width: 30px; height: 30px;\">",
                    @"</div></body></html>"
                    ];
    return aa;
}

@end
