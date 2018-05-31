//
//  PageC.m
//  测试
//
//  Created by mac on 2018/5/31.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PageC.h"

@implementation PageC


-(NSMutableArray *)pageArr{
    if (!_pageArr) {
        _pageArr = [NSMutableArray new];
    }
    return _pageArr;
}
//1.实例化page
- (instancetype)initWithFrame:(CGRect)frame andPageNum:(NSInteger)pageNum
{
    self = [super initWithFrame:frame];
    if (self) {
        _page = 0;
        _pageColor = [UIColor whiteColor];
        _pageHetColor = [UIColor orangeColor];
        for (int i = 0; i < pageNum; i++){
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = 10+i;
            button.backgroundColor = _pageColor;
            [button addTarget:self action:@selector(pageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [self.pageArr addObject:button];
        }
    }
    return self;
}

//布局
-(void)layoutSubviews{
    CGRect rect = self.frame;
    rect.size = CGSizeMake(_pageClearance+(_pageSize.width+_pageClearance)*self.pageArr.count, _pageSize.height);
    self.frame = rect;
    for (UIView * topview in self.pageArr) {
        if ([topview isKindOfClass:[UIButton class]]) {
            UIButton * button = (UIButton *)topview;
            button.frame = CGRectMake(_pageClearance + (_pageClearance+_pageSize.width)*(button.tag-10), 0, _pageSize.width, _pageSize.height);
            button.backgroundColor = _page == (button.tag-10)?_pageHetColor:_pageColor;
            [button setBackgroundImage:_pageImage[(button.tag-10)] forState:UIControlStateNormal];
            [button setBackgroundImage:_pageHetImage[(button.tag-10)] forState:UIControlStateSelected];
            button.layer.cornerRadius = _Style == pageCBtnStyleNome? 0 :_pageSize.width/2;
            button.selected = _page == (button.tag-10)?YES:NO;
        }
    }
}
-(void)setPage:(NSInteger)page{
    _page = page;
    [self layoutSubviews];
}
-(void)pageBtnAction:(UIButton *)sender{
    _page = sender.tag-10;
    if (self.updateUserInfoBlock) {
        self.updateUserInfoBlock(_page);
    }
    [self layoutSubviews];
}
//因为系统自带有set方法如过有其他需要可以解开注释
//-(void)setStyle:(pageCBtnStyle)Style{
//    _Style = Style;
//}
//
//-(void)setPageSize:(CGSize)pageSize{
//    _pageSize = pageSize;
//}
//
//-(void)setPageClearance:(NSInteger)pageClearance{
//    _pageClearance = pageClearance;
//}
//
//-(void)setPageColor:(UIColor *)pageColor{
//    _pageColor = pageColor;
//}
//
//-(void)setPageHetColor:(UIColor *)pageHetColor{
//    _pageHetColor = pageHetColor;
//}
//

//-(void)setPageImage:(UIImage *)pageImage{
//    _pageImage = pageImage;
//
//}
//-(void)setPageHetImage:(UIImage *)pageHetImage{
//    _pageHetImage = pageHetImage;
//}

@end
