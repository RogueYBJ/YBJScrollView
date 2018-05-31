//
//  ScrollV.h
//  测试
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GreenInterfaceDelegate <NSObject>
// 让协议方法带参传值
/**点击图片传递的值*/
- (void) pushScrollVAction:(NSInteger ) valueTag;
/**改变page传递的值*/
- (void) pageNum:(NSInteger ) pageNum;
@end



@interface ScrollV : UIScrollView<UIScrollViewDelegate>

//ImageArr图片的数组  titleArr标题数组
- (instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray*)ImageArr andTitle:(NSArray *)titleArr;
//开始轮播
-(void)start;
//暂停轮播
-(void)stop;

/**需要的代理*/
@property (nonatomic, weak) id <GreenInterfaceDelegate> delegates;

//点击page的用户交互
-(void)pageContentOffset:(NSInteger)page;

@end
