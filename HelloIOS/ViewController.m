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
#import "ScrollViewController.h"
#import "PickerViewController.h"
#import "CollectionViewController.h"
#import "CustomViewController.h"
#import "FSBaseViewController.h"
#import "AutoLayoutSampleViewController.h"
#import "ShapeSampleViewController.h"
#import "ScrollNoticeViewController.h"
#import "AnimationViewController.h"
#import "WebviewListViewController.h"
#import "LabelHtmlViewController.h"


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
    self.tableView.showsVerticalScrollIndicator = NO;
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
            ScrollViewController *vc = [[ScrollViewController alloc] init];
            vc.title = @"ScrollView";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 10: {
            PickerViewController *vc = [[PickerViewController alloc] init];
            vc.title = @"PickerView";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 11: {
            CollectionViewController *vc = [[CollectionViewController alloc] init];
            vc.title = @"集合视图";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 12: {
            CustomViewController *vc = [[CustomViewController alloc] init];
            vc.title = @"自定义View";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 13: {
            FSBaseViewController *vc = [[FSBaseViewController alloc] init];
            vc.title = @"Scroll套Table";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 14: {
            AutoLayoutSampleViewController *vc = [[AutoLayoutSampleViewController alloc] init];
            vc.title = @"自动布局测试";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 15: {
            ShapeSampleViewController *vc = [[ShapeSampleViewController alloc] init];
            vc.title = @"图形";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 16: {
            ScrollNoticeViewController *vc = [[ScrollNoticeViewController alloc] init];
            vc.title = @"轮播公告";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 17: {
            AnimationViewController *vc = [[AnimationViewController alloc] init];
            vc.title = @"动画";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 18: {
            WebviewListViewController *vc = [[WebviewListViewController alloc] init];
            vc.title = @"WebviewList";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 19: {
            LabelHtmlViewController *vc = [[LabelHtmlViewController alloc] init];
            vc.title = @"LabelHtml";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
    }
}



@end
