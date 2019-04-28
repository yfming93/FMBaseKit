//
//  FMBaseKitNavigationController.h
//  FMBaseKit
//
//  Created by 袁凤鸣 on 2017/4/7.
//  Copyright © 2017年 mingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMBaseKitNavigationController : UINavigationController
/// 导航栏底部的细线 颜色
@property (copy, nonatomic) UIColor *navBottomLineColor;
/// 导航栏的 背景图 或者 背景颜色
@property (nonatomic, strong) id backgroundImageOrColor;

- (void)hideNavBottomLine;
- (void)showNavBottomLine;

@end
