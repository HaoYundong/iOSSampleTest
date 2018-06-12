//
//  WebviewListViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/6/7.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "WebviewListViewController.h"
#import "WebviewListTableViewCell.h"
#import "WebListTableViewCell.h"

@interface WebviewListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;
@property(nonatomic,strong)NSMutableDictionary *heightDic;

@end

@implementation WebviewListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}

- (void)setup {
    self.heightDic = [[NSMutableDictionary alloc] init];
    // 注册加载完成高度的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:@"WEBVIEW_HEIGHT" object:nil];
    
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WebListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[WebListTableViewCell getIdentifier] forIndexPath:indexPath];
    cell.tag = indexPath.row;
    cell.contentStr = nil;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.heightDic objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row]] floatValue];
//    return UITableViewAutomaticDimension;
}

#pragma mark - private method

- (void)noti:(NSNotification *)sender {
    WebListTableViewCell *cell = [sender object];
    NSLog(@"%@",@(cell.tag));
    if (![self.heightDic objectForKey:[NSString stringWithFormat:@"%ld",cell.tag]] || [[self.heightDic objectForKey:[NSString stringWithFormat:@"%ld",cell.tag]] floatValue] != cell.height) {
        [self.heightDic setObject:[NSNumber numberWithFloat:cell.height] forKey:[NSString stringWithFormat:@"%ld",cell.tag]];
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:cell.tag inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    }
}

#pragma mark - laze load view

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style: UITableViewStylePlain];
        _tableView.separatorStyle = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
//        _tableView.estimatedRowHeight = 100;
        [_tableView registerNib:[UINib nibWithNibName:[WebviewListTableViewCell getIdentifier] bundle:nil] forCellReuseIdentifier:[WebviewListTableViewCell getIdentifier]];
        [_tableView registerClass:[WebListTableViewCell class] forCellReuseIdentifier:[WebListTableViewCell getIdentifier]];
    }
    
    return _tableView;
}

@end
