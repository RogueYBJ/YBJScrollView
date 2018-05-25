//
//  ViewController.m
//  qwer
//
//  Created by mac on 2018/5/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import <ScrollView/ScrollView.h>
#define UIScreen_Width [UIScreen mainScreen].bounds.size.width//宽
#define UIScreen_Height [UIScreen mainScreen].bounds.size.height//高
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * arr1 = @[@"轮播图1_左",@"轮播图2_左",@"轮播图3_左",@"轮播图4_左"];
    NSArray * arr2 = @[@"轮播图4_右",@"轮播图3_右",@"轮播图2_右",@"轮播图1_右"];
    
    NSArray * arr = [NSArray arrayWithObjects:arr1,arr2, nil];
    
    YBJ_ScrollView * Scroll = [[YBJ_ScrollView alloc] initWithFrame:CGRectMake(0, 20, UIScreen_Width, UIScreen_Width/2) andImageArr:arr];
    
    [self.view addSubview:Scroll];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
