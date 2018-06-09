//
//  WebviewListTableViewCell.h
//  HelloIOS
//
//  Created by haoyundong on 2018/6/7.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebviewListTableViewCell : UITableViewCell

- (void)bindData;

+ (NSString *)getIdentifier;

@end
