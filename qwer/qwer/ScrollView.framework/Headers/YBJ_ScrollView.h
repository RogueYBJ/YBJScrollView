//
//  YBJ_ScrollView.h
//  QHZZB
//
//  Created by mac on 2018/4/15.
//  Copyright © 2018年 YBJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWDPageControl.h"
/**
 * 类型自定义
 */
typedef void (^ReturnValueBlock) (NSString* TextValue);

@interface YBJ_ScrollView : UIView<UIScrollViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray *)imageArr;
//返回当前业

@property(nonatomic, copy) ReturnValueBlock returnValueBlock;

@end
