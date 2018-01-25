//
//  MainPageTableViewCell.m
//  HelloIOS
//
//  Created by haoyundong on 2018/1/24.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "MainPageTableViewCell.h"

@interface MainPageTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *pageName;

@end

@implementation MainPageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configure:(NSString *)title {
    if (title.length > 0) {
        self.pageName.text = title;
    } else {
        self.pageName.text = @"";
    }
}

@end
