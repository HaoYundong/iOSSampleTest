//
//  DynamicAddViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/1/24.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "DynamicAddViewController.h"

@interface DynamicAddViewController ()

@end

@implementation DynamicAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    // 添加一个默认View
    [self addViewTest1];
    
    // UILabel测试
    //    [self UILabelTest];
    
    // UIImage测试
    //    [self UIImageTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addViewTest1 {
    // 视图
    UIView *view1 = [[UIView alloc] init];
    // 位置大小
    view1.frame = CGRectMake(100, 100, 300, 50);
    // 背影颜色
    view1.backgroundColor = [UIColor greenColor];
    // 将视图加入到父视图中
    [self.view addSubview:view1];
}

- (void)UILabelTest {
    self.view.backgroundColor = [UIColor yellowColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 100, 300, 300);
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"我是一个标签我是一个标签我是一个标签我是一个标签我是一个标签我是一个标签我是一个标签我是一个标签我是一个标签";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    // 字体的加粗或倾斜
    label.font = [UIFont boldSystemFontOfSize:20];
    label.font = [UIFont italicSystemFontOfSize:20];
    
    // 设置字体
    label.font = [UIFont fontWithName:@"bODONI 72" size:20];
    
    // 设置文字阴影
    label.shadowColor = [UIColor redColor];
    label.shadowOffset = CGSizeMake(8, 8);
    
    // 自动取色
    label.textColor = [UIColor colorWithRed:0.18f green:0.63f blue:0.86f alpha:1.00f];
    
    // 如果文字太多，要设置自动换行
    label.lineBreakMode = NSLineBreakByWordWrapping;
    // 如果把行数设置为-1或0，意思是不限制行数，自适应于内容
    label.numberOfLines = 0;
    
    // 根据字符大小计算frame大小
    CGSize size = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(355, 10000) lineBreakMode:NSLineBreakByCharWrapping];
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, size.height);
    
    [self.view addSubview:label];
    
}

- (void)UIImageTest {
    // 加载方式1：
    //    NSString *projectPath = [[NSBundle mainBundle] resourcePath];
    //    NSString *imagePath = [NSString stringWithFormat:@"%@/logo.png", projectPath];
    //    UIImage *image = [[UIImage alloc] initWithData:<#(nonnull NSData *)#>];
    
    // 加载方式2：
    UIImage *image = [UIImage imageNamed:@"logo"]; // 如果是png格式的，只写一个文件名就可以，如果是jpg的需要写全
    //需要一个载体
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(10, 100, image.size.width, image.size.height);
    imageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imageView];
    
    // 内容模式
    /*
     UIViewContentModeScaleToFill - 拉伸充满整个载体（默认）
     UIViewContentModeScaleAspectFill - 拉伸不改变比例，充满最大的一边
     UIViewContentModeScaleAspectFit - 拉伸不改变比例，充满最小的一边
     */
    imageView.contentMode = UIViewContentModeCenter;
    
    // UIImageView动画 - 播放序列图
}

@end
