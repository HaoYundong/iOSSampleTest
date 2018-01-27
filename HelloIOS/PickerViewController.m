//
//  PickerViewController.m
//  HelloIOS
//
//  Created by haoyundong on 2018/1/27.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *displayView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSDictionary *allData;
@property (nonatomic, strong) NSArray *firstData;
@property (nonatomic, strong) NSArray *secondData;
@property (nonatomic, assign) NSInteger firstLevelNum;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initConfig];
    [_pickerView reloadAllComponents];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource

// 用来标识轮盘的个数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// 用来标识当前轮盘的数据的个数  returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [_firstData count];
    } else {
        return [_secondData count];
    }
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [_firstData objectAtIndex:row];
    } else {
        return [_secondData objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        _firstLevelNum = row;
        _secondData = nil;
        _secondData = [_allData objectForKey:[_firstData objectAtIndex:row]];
        [_pickerView reloadComponent:1];
    } else {
        _displayView.text = [NSString stringWithFormat:@"%@ %@", [_firstData objectAtIndex:_firstLevelNum], [_secondData objectAtIndex:row]];
    }
}

#pragma mark - private method

- (void)initConfig {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"provinces_cities" ofType:@"plist"];
    _allData = [NSDictionary dictionaryWithContentsOfFile:path];
    
    _firstData = [_allData allKeys];
    _secondData = [_allData objectForKey:[_firstData objectAtIndex:0]];
    
    _firstLevelNum = 0;
}


@end
