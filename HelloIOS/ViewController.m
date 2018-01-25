//
//  ViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2017/9/4.
//  Copyright © 2017年 芝麻连接科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "MainPageTableViewCell.h"
#import "DynamicAddViewController.h"
#import "LoadingViewController.h"
#import "AlertViewController.h"
#import "ActionSheetViewController.h"
#import "TimerViewController.h"
#import "TableViewController.h"
#import "KeyboardViewController.h"
#import "ScreenViewController.h"
#import "DatePickerViewController.h"


static NSString* kMainPageTableViewCell = @"MainPageTableViewCell";

@interface ViewController ()<
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"主页面";
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    
    [self initPageList];
    [self setupUI];
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


#pragma mark -  private methods

- (void)setupUI {
    [self.tableView registerNib:[UINib nibWithNibName:kMainPageTableViewCell bundle:nil] forCellReuseIdentifier:kMainPageTableViewCell];
    [self.tableView reloadData];
}

- (void)initPageList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pagelist" ofType:@"plist"];
    self.pagelist = [NSArray arrayWithContentsOfFile:path];
}

- (void)jumpPage:(NSInteger)index {
    switch (index) {
        case 0: {
            DynamicAddViewController *vc = [[DynamicAddViewController alloc] init];
            vc.title = @"动态布局";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1: {
            LoadingViewController *vc = [[LoadingViewController alloc] init];
            vc.title = @"加载中";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2: {
            AlertViewController *vc = [[AlertViewController alloc] init];
            vc.title = @"弹窗提示";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3: {
            ActionSheetViewController *vc = [[ActionSheetViewController alloc] init];
            vc.title = @"底部弹窗";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4: {
            TimerViewController *vc = [[TimerViewController alloc] init];
            vc.title = @"进度条";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5: {
            TableViewController *vc = [[TableViewController alloc] init];
            vc.title = @"列表";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 6: {
            KeyboardViewController *vc = [[KeyboardViewController alloc] init];
            vc.title = @"软键盘控制";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 7: {
            ScreenViewController *vc = [[ScreenViewController alloc] init];
            vc.title = @"横竖屏控制";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 8: {
            DatePickerViewController *vc = [[DatePickerViewController alloc] init];
            vc.title = @"日期日间选择器";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 9: {
            break;
        }
        case 10: {
            break;
        }
    }
}



@end
