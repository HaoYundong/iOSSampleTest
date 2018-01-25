//
//  TableViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2017/9/19.
//  Copyright © 2017年 芝麻连接科技有限公司. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

@synthesize dataArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [[NSArray alloc] initWithObjects:@"aa", @"bb", @"cc", @"dd", @"ee", @"ff", @"gg", @"hh", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    NSLog(@"点击了返回按钮");
    [self dismissModalViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger position = [indexPath row];
    NSString *rowValue = [dataArray objectAtIndex:position];
    
    NSString *message = [[NSString alloc] initWithFormat:@"你选择了: %@", rowValue];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"第一部分";
            break;
        case 1:
            return @"第二部分";
            break;
        case 2:
            return @"第三部分";
            break;
        default:
            return @"其它部分";
            break;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifer = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(cellIdentifer)];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    // Config the cell...
    NSUInteger position = [indexPath row];
    cell.textLabel.text = [dataArray objectAtIndex:position];
    
    return cell;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView  {
    return dataArray;
}

@end
