//
//  ScrollV.m
//  测试
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ScrollV.h"

@interface ScrollV ()

@property(strong ,nonatomic)NSTimer * myTimer;//时间控制器，循环轮播

@end

@implementation ScrollV

-(NSTimer*)myTimer{
    if (!_myTimer) {
        _myTimer =  [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(myTimertion) userInfo:nil repeats:YES];
    }
    return _myTimer;
}

- (instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray*)ImageArr andTitle:(NSArray *)titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        //取消反弹效果
        self.bounces = NO;
        //隐藏垂直方向的滑动条也就是滑块
        self.showsVerticalScrollIndicator = NO;
        //隐藏水平方向的滑动条也就是滑块
        self.showsHorizontalScrollIndicator = NO;
        //设置内部宽高
        self.contentSize = CGSizeMake(CGRectGetWidth(self.bounds)*(ImageArr.count+2), CGRectGetHeight(self.bounds));
        //设置原点偏移量
        self.contentOffset = CGPointMake(0, 0);
        //设置滚动试图的代理
        self.delegate = self;
        //设置分页效果
        self.pagingEnabled = YES;
        
        //创建视图
        for (int i = 0; i<ImageArr.count; i++) {
            
            if (i==0) {
                //可点击的图片可以用UIButton
                UIButton * imageBtn = [[UIButton alloc]initWithFrame:CGRectOffset(self.bounds, CGRectGetWidth(self.bounds) * i, 0)];
                //设置tag值
                imageBtn.tag = 10+ImageArr.count-1;
                //赋值图像
                [imageBtn setBackgroundImage:ImageArr[ImageArr.count-1] forState:UIControlStateNormal];
                //添加一个手势
                [imageBtn addTarget:self action:@selector(ImageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
                //添加到滚动式图
                [self addSubview: imageBtn];
                //标题
                UILabel * TitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(imageBtn.bounds)-30, CGRectGetWidth(imageBtn.bounds), 30)];;
                TitleLabel.text = titleArr[titleArr.count -1];
                [self AddSublayerColor:TitleLabel];
                [imageBtn addSubview:TitleLabel];
            }
            if (i==ImageArr.count-1) {
                UIButton * imageBtn = [[UIButton alloc]initWithFrame:CGRectOffset(self.bounds, CGRectGetWidth(self.bounds) * (i+2), 0)];
                imageBtn.tag = 10;
                [imageBtn setBackgroundImage:ImageArr[0] forState:UIControlStateNormal];
                [imageBtn addTarget:self action:@selector(ImageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview: imageBtn];
                //标题
                UILabel * TitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(imageBtn.bounds)-30, CGRectGetWidth(imageBtn.bounds), 30)];
                TitleLabel.text = titleArr[0];
                [self AddSublayerColor:TitleLabel];
                [imageBtn addSubview:TitleLabel];
            }
            UIButton * imageBtn = [[UIButton alloc]initWithFrame:CGRectOffset(self.bounds, CGRectGetWidth(self.bounds) * (i+1), 0)];
            imageBtn.tag = 10+i;
            [imageBtn setBackgroundImage:ImageArr[i] forState:UIControlStateNormal];
            [imageBtn addTarget:self action:@selector(ImageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview: imageBtn];
            //标题
            UILabel * TitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(imageBtn.bounds)-30, CGRectGetWidth(imageBtn.bounds), 30)];
            TitleLabel.text = titleArr[i];
            [self AddSublayerColor:TitleLabel];
            [imageBtn addSubview:TitleLabel];
        }
    }
    return self;
}
//开始轮播
-(void)start{
    [self.myTimer setFireDate:[NSDate distantPast]];
}
//停止轮播
-(void)stop{
    [self.myTimer setFireDate:[NSDate distantFuture]];
}
//时间控制器循环方法
-(void)myTimertion{
    [self Dpage] >= [self Zpage]-1?self.contentOffset = CGPointMake(CGRectGetWidth(self.bounds),0):[self Dpage] >= [self Zpage]-2?self.contentOffset = CGPointMake(0,0):NSLog(@"");
    [self Successful:[self Dpage]];
}
//scrollV.contentOffset向前滑动一页
-(void)Successful:(NSInteger)page{
    [self.delegates pageNum:page];
    [UIView animateWithDuration:0.5f animations:^{
        self.contentOffset = CGPointMake(CGRectGetWidth(self.bounds)*(page+1), 0);
    }];
}
//获取总页数
-(NSInteger)Zpage{
    CGSize size = self.contentSize;
    NSInteger x = size.width/CGRectGetWidth(self.bounds);
    return x;
}
//获取当前页
-(NSInteger)Dpage{
    CGPoint point = self.contentOffset;
    NSInteger x = point.x/CGRectGetWidth(self.bounds);
    return x;
}
//滑动效果减速结束后
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self Dpage] >= [self Zpage]-1?self.contentOffset = CGPointMake(CGRectGetWidth(self.bounds),0):[self Dpage] <= 0 ?self.contentOffset = CGPointMake(CGRectGetWidth(self.bounds)*([self Zpage]-2),0):NSLog(@"page:%ld",[self Dpage]);
    [self.delegates pageNum:[self Dpage]-1];
}
//点击事件
-(void)ImageBtnAction:(UIButton *)sender{
    
    [self.delegates pushScrollVAction:sender.tag];
    
}

//创建一个潜变颜色列表
-(void)AddSublayerColor:(UILabel *)label{
    //  创建 CAGradientLayer 对象
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    //  设置 gradientLayer 的 Frame
    gradientLayer.frame = label.bounds;
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(id)[UIColor blackColor].CGColor,
                             (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:0].CGColor];
    //  设置三种颜色变化点，取值范围 0.0~1.0
//    gradientLayer.locations = @[@(0.1f)];
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0.5f, 1);
    gradientLayer.endPoint = CGPointMake(0.5f, 0);
    //  添加渐变色到创建的 UIView 上去
    [label.layer addSublayer:gradientLayer];
}
//点击page的用户交互
-(void)pageContentOffset:(NSInteger)page{
    [UIView animateWithDuration:0.5f animations:^{
        self.contentOffset = CGPointMake(CGRectGetWidth(self.bounds)*(page), 0);
    }];
}
@end
