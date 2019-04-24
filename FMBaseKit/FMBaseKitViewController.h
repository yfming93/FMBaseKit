//
//  FMBaseKitViewController.h
//  FMBaseKit
//
//  Created by mingo on 2018/6/5.
//  Copyright © 2018年 mingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMBaseKitViewController
: UIViewController
@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;
typedef void(^BtnActionBlock)(id objc);

/// 弹一个确认框
-(void)fm_alertControllerTitlie:(NSString *)str1 subTitle:(NSString *)str2;

- (UIButton *)fm_navigationTargetController:(UIViewController *)targetViewController isLeft:(BOOL)isLeft barTitle:(NSString *)title buttonTextColor:(UIColor *)buttonTextColor itemButtonImaName:(NSString *)itemImaName btnHandler:(BtnActionBlock)btnActionBlock;

@end
