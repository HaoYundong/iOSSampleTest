//
//  TableViewController.h
//  HelloIOS
//
//  Created by haoyundong on 2017/9/19.
//  Copyright © 2017年 芝麻连接科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>{
    
    NSArray *dataArray;
}

@property (nonatomic, retain) NSArray *dataArray;

- (IBAction)back:(id)sender;


@end
