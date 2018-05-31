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
#import "PageC.h"
@interface ViewController ()<GreenInterfaceDelegate>{
PageC * page;
}
- (void)viewDidLoad {
[super viewDidLoad];
//创建轮播图
ScrollV * scroll = [[ScrollV alloc]initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), 200) andImageArr:@[[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpeg"],[UIImage imageNamed:@"5.jpg"],] andTitle:@[@"   1.你好！",@"   2.我好！",@"   3.大家好"]];
//签订协议
scroll.delegates = self;

//开始轮播
[scroll start];

[self.view addSubview:scroll];

//创建分页page（这里的frma的宽高会适配的）
page = [[PageC alloc]initWithFrame:CGRectMake(300, 200, CGRectGetWidth(self.view.bounds), 20) andPageNum:3];
//设定风格
page.Style = pageCBtnStyleRound;
//设定每个按钮的宽高
page.pageSize = CGSizeMake(10, 10);
//设定间隙可间距
page.pageClearance = 20;
//设置背景图片
//    page.pageImage = @[[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpeg"],[UIImage imageNamed:@"5.jpg"]];
//    //设置高亮背景图片
//    page.pageHetImage = @[[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"3.jpg"]];
[self.view addSubview:page];
page.updateUserInfoBlock = ^(NSInteger page) {
[scroll pageContentOffset:page+1];
};
}
//协议方法回调
-(void)pushScrollVAction:(NSInteger)valueTag{
NSLog(@"delegates:%ld",valueTag);
}
-(void)pageNum:(NSInteger)pageNum{
page.page = pageNum;
}
```
###
![ 效果图 ](https://github.com/RogueYBJ/YBJScrollView/raw/master/lbt.gif)

