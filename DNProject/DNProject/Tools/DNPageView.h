//
//  DNPageView.h
//  163Music
//
//  Created by zjs on 2018/8/20.
//  Copyright © 2018年 zjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DNPageView : UIView
// 顶部 segmentView 的高度
@property (nonatomic, assign) CGFloat topTapHeight;
// 未选中字体大小
@property (nonatomic, assign) CGFloat normalFontSize;
// 选中字体大小
@property (nonatomic, assign) CGFloat selectFontSize;
// 未选中字体颜色
@property (nonatomic, strong) UIColor * normalColor;
// 选中字体颜色
@property (nonatomic, strong) UIColor * selectColor;

- (instancetype)initWithTitle:(NSArray *)title controller:(NSArray *)object;

@end
