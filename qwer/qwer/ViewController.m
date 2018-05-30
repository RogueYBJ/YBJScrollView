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

#import "ScrollV.h"

@interface ViewController ()<GreenInterfaceDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这是第一个
    NSArray * arr1 = @[@"轮播图1_左",@"轮播图2_左",@"轮播图3_左",@"轮播图4_左"];
    NSArray * arr2 = @[@"轮播图4_右",@"轮播图3_右",@"轮播图2_右",@"轮播图1_右"];
    
    NSArray * arr = [NSArray arrayWithObjects:arr1,arr2, nil];
    
    YBJ_ScrollView * Scroll = [[YBJ_ScrollView alloc] initWithFrame:CGRectMake(0, 20, UIScreen_Width, UIScreen_Width/2) andImageArr:arr];
    
    [self.view addSubview:Scroll];
    
    //这是第二个
    
    //创建轮播图
    ScrollV * scroll = [[ScrollV alloc]initWithFrame:CGRectMake(0, 400, CGRectGetWidth(self.view.bounds), 200) andImageArr:@[[UIImage imageNamed:@"轮播图1_左"],[UIImage imageNamed:@"轮播图2_左"],[UIImage imageNamed:@"轮播图3_左"]]];
    //签订协议
    scroll.delegates = self;
    //开始轮播
    [scroll start];
    //添加到View上
    [self.view addSubview:scroll];
    
}

//协议方法回调
-(void)pushScrollVAction:(NSInteger)valueTag{
    NSLog(@"delegates:%ld",valueTag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
