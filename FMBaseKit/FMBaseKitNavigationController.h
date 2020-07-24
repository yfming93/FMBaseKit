//
//  FMBaseKitNavigationController.h
//  FMBaseKit
//
//  Created by 袁凤鸣 on 2017/4/7.
//  Copyright © 2017年 mingo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, FMGradientDirection) {
        /// 水平渐变
    FMGradientDirectionLevel,
        /// 竖直渐变
    FMGradientDirectionVertical,
        /// 向下对角线渐变
    FMGradientDirectionUpwardDiagonalLine,
        /// 向上对角线渐变
    FMGradientDirectionDownDiagonalLine,
};

@interface FMBaseKitNavigationController : UINavigationController
/// 导航栏底部的细线 颜色
@property (copy, nonatomic) UIColor *navBottomLineColor;
/// 导航栏的 背景图 或者 背景颜色
@property (nonatomic, strong) id backgroundImageOrColor;

- (void)hideNavBottomLine;
- (void)showNavBottomLine;
- (UIImage *)fm_backgroundColorGradientChangeWithDirection:(FMGradientDirection)direction startColor:(UIColor *)startcolor endColor:(UIColor *)endColor;
@end
