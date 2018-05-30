# YBJScrollView
A simple multicast map


###
第一个轮播图
```
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * arr1 = @[@"轮播图1_左",@"轮播图2_左",@"轮播图3_左",@"轮播图4_左"];
    NSArray * arr2 = @[@"轮播图4_右",@"轮播图3_右",@"轮播图2_右",@"轮播图1_右"];

    NSArray * arr = [NSArray arrayWithObjects:arr1,arr2, nil];

    YBJ_ScrollView * Scroll = [[YBJ_ScrollView alloc] initWithFrame:CGRectMake(0, 20, UIScreen_Width, UIScreen_Width/2) andImageArr:arr];

    [self.view addSubview:Scroll];
}
```
###
![ 效果图 ](https://github.com/RogueYBJ/YBJScrollView/raw/master/xgt.gif)


###
第二个轮播图
```
#import "ViewController.h"
#import "ScrollV.h"

@interface ViewController ()<GreenInterfaceDelegate>

- (void)viewDidLoad {
[super viewDidLoad];
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
```
###
![ 效果图 ](https://github.com/RogueYBJ/YBJScrollView/raw/master/lbt.gif)

