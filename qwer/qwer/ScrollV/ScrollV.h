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
/**传递的值*/
- (void) pushScrollVAction:(NSInteger ) valueTag;

@end
@interface ScrollV : UIScrollView<UIScrollViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray*)ImageArr;
//开始轮播
-(void)start;
//暂停轮播
-(void)stop;

/**需要的代理*/
@property (nonatomic, weak) id <GreenInterfaceDelegate> delegates;


@end
