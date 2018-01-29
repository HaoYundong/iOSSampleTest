//
//  CollectionViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/1/29.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "CollectionViewController.h"
#import "EventCollectionViewCell.h"

#define COL_NUM 3

@interface CollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (strong, nonatomic) NSArray *data;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initData];
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    int num = [_data count] % COL_NUM;
    if (num == 0) {
        return [_data count] / COL_NUM;
    } else {
        return [_data count] / COL_NUM + 1;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return COL_NUM;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EventCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifer" forIndexPath:indexPath];
    
    // 计算下标索引
    NSInteger idx = indexPath.section * COL_NUM + indexPath.row;
    //防止下标越界
    if (idx > [_data count]) {
        return cell;
    }
    
    cell.label.text = [_data objectAtIndex:idx];
    cell.imageView.image = [UIImage imageNamed:@"logo.png"];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 计算下标索引
    NSInteger idx = indexPath.section * COL_NUM + indexPath.row;
    if (idx > [_data count]) {
        return;
    }
    NSLog(@"选择的item为： %@", [_data objectAtIndex:idx]);
}

#pragma mark - private method

- (void)initData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pagelist" ofType:@"plist"];
    _data = [NSArray arrayWithContentsOfFile:path];
}

- (void)setupView {
    [_collectionView registerClass:[EventCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifer"];
    
    // 单元格的尺寸
    _flowLayout.itemSize = CGSizeMake(80, 80);
    // 设置流式布局的内边距
    _flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 20, 15);
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    // 适配plus机型
    if (screenSize.height > 568) {
        _flowLayout.itemSize = CGSizeMake(100, 100);
        _flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 20, 15);
    }
    // 设置单元格间距
    _flowLayout.minimumLineSpacing = 10;
    
    
}

@end
