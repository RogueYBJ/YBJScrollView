//
//  PageC.h
//  测试
//
//  Created by mac on 2018/5/31.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

//按钮的风格
typedef NS_ENUM(NSInteger ,pageCBtnStyle) {
    pageCBtnStyleNome = 0,//方形
    pageCBtnStyleRound,//圆形
//    pageCBtnStyleNome,
};


@interface PageC : UIView

/*
 这里我们自定义一个page
 1.实例化page
 2.什么形状的按钮
 3.几个按钮
 4.按钮的布局
 */
 //1.实例化page通过传入的pageNum来确认创建几个自控制器
- (instancetype)initWithFrame:(CGRect)frame andPageNum:(NSInteger)pageNum;

//创建数组保存page
@property(strong ,nonatomic)NSMutableArray * pageArr;
//按钮风格
@property(assign ,nonatomic)pageCBtnStyle Style;
//按钮的大小
@property(assign ,nonatomic)CGSize pageSize;
//按钮的间隙和边距
@property(assign ,nonatomic)NSInteger pageClearance;
//按钮背景颜色
@property(strong ,nonatomic)UIColor * pageColor;
//按钮选中背景颜色
@property(strong ,nonatomic)UIColor * pageHetColor;
//按钮背景图片数组
@property(strong ,nonatomic)NSArray * pageImage;
//按钮选中背景图片数组
@property(strong ,nonatomic)NSArray * pageHetImage;
//当前页
@property(assign ,nonatomic)NSInteger page;
//block 的回调方法 点击返回当前页
@property(nonatomic, copy)void(^updateUserInfoBlock)(NSInteger page);
@end
