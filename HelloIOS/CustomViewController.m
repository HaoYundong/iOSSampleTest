//
//  CustomViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/2/5.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "CustomViewController.h"
#import "MainPageTableViewCell.h"
#import "SimpleCustomViewController.h"

static NSString* kMainPageTableViewCell = @"MainPageTableViewCell";

@interface CustomViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray<NSString *> *pagelist;

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  UITableViewDelegate && UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pagelist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainPageTableViewCell forIndexPath:indexPath];
    [cell configure:self.pagelist[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self jumpPage:indexPath.row];
}

#pragma mark - private method

- (void)initData {
    _pagelist = [NSArray arrayWithObjects:
                 @"自定义简单View",
                 @"自定义复杂View",
                 nil];
    [self.tableView registerNib:[UINib nibWithNibName:kMainPageTableViewCell bundle:nil] forCellReuseIdentifier:kMainPageTableViewCell];
    [self.tableView reloadData];
}

- (void)jumpPage:(NSInteger)index {
    switch (index) {
        case 0: {
            SimpleCustomViewController *vc = [[SimpleCustomViewController alloc] init];
            vc.title = [_pagelist objectAtIndex:index];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
    }
}



@end
