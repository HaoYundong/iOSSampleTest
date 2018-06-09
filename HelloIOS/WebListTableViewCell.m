//
//  WebListTableViewCell.m
//  HelloIOS
//
//  Created by haoyundong on 2018/6/8.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "WebListTableViewCell.h"

@implementation WebListTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSLog(@"contentView.bounds:  %@",NSStringFromCGRect(self.contentView.bounds));
        [self.contentView addSubview:self.webView];
    }
    return self;
}

// contentStr 用于更新值
-(void)setContentStr:(NSString *)contentStr {
    _contentStr = contentStr;
    
    [self.webView loadHTMLString:[self getHtmlData] baseURL:nil];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 如果要获取web高度必须在网页加载完成之后获取
    
    // 方法一
    CGSize fittingSize = [self.webView sizeThatFits:CGSizeZero];
    
    // 方法二
    //    CGSize fittingSize = webView.scrollView.contentSize;
    NSLog(@"webView:%@",NSStringFromCGSize(fittingSize));
    self.height = fittingSize.height;
    
    self.webView.frame = CGRectMake(0, 0, fittingSize.width, fittingSize.height);
    
    // 用通知发送加载完成后的高度
    [[NSNotificationCenter defaultCenter] postNotificationName:@"WEBVIEW_HEIGHT" object:self userInfo:nil];
}

#pragma mark - private method

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

#pragma mark - lazy load

- (UIWebView *)webView {
    if (!_webView) {
        // 高度必须提前赋一个值 >0
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 1)];
        _webView.backgroundColor = [UIColor clearColor];
        _webView.opaque = NO;
        _webView.userInteractionEnabled = NO;
        _webView.scrollView.bounces = NO;
        _webView.delegate = self;
        _webView.paginationBreakingMode = UIWebPaginationBreakingModePage;
        _webView.scalesPageToFit = YES;
    }
    
    return _webView;
}


+ (NSString *)getIdentifier {
    return @"WebListTableViewCell";
}

@end
