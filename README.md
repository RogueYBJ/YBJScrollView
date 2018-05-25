# YBJScrollView
A simple multicast map

###
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
![ 效果图 ](https://github.com/RogueYBJ/YBJScrollView/xgt.gif)
