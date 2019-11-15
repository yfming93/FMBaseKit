//
//  FMBaseKitNavigationController.m
//  FMBaseKit
//
//  Created by 袁凤鸣 on 2017/4/7.
//  Copyright © 2017年 mingo. All rights reserved.
//

#import "FMBaseKitNavigationController.h"
//#define kColorCCC [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.00] /// 灰色
#define kColorCCC UIColor.clearColor
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface FMBaseKitNavigationController ()<UIGestureRecognizerDelegate>
@property (strong, nonatomic) UIView *navLineV;

@end

@implementation FMBaseKitNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modalPresentationStyle = UIModalPresentationFullScreen;

}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self fm_exchangeNavBottomLine];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
    
#pragma mark -  通过拦截push方法来设置每个push进来的控制器的返回按钮
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:YES];
    
}

#pragma mark - 导航栏的 背景图 或者 背景颜色
-(void)setBackgroundImageOrColor:(id)backgroundImageOrColor {
    if (backgroundImageOrColor == nil) {
        backgroundImageOrColor = [self imageWithColor:UIColor.clearColor];
    }else if ([backgroundImageOrColor isKindOfClass:[UIColor class]]) {
        backgroundImageOrColor = [self imageWithColor:backgroundImageOrColor];
    }
    if ([backgroundImageOrColor isKindOfClass:[UIImage class]]) {
        backgroundImageOrColor = [backgroundImageOrColor resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
        [self.navigationBar setBackgroundImage:backgroundImageOrColor forBarMetrics:UIBarMetricsDefault];
    }
}

#pragma mark - 导航栏底部的细线
-(void)setNavBottomLineColor:(UIColor *)navBottomLineColor {
    _navBottomLineColor = navBottomLineColor;
    if (navBottomLineColor) {
        [self fm_exchangeNavBottomLine];
    }
}

- (void)fm_exchangeNavBottomLine {
    //藏旧
    [self hideBorderInView:self.navigationBar];
    //添新
//    if (!_navLineV) {
//
//    }
    _navLineV = [[UIView alloc]initWithFrame:CGRectMake(0, 44, kScreenWidth, 1.0 / [UIScreen mainScreen].scale)];
    UIColor *color = kColorCCC;
    if (self.navBottomLineColor) {
        color = self.navBottomLineColor;
    }
    _navLineV.backgroundColor = color;
    [self.navigationBar addSubview:_navLineV];
}

- (void)hideNavBottomLine{
    [self hideBorderInView:self.navigationBar];
    if (_navLineV) {
        _navLineV.hidden = YES;
    }
}

- (void)showNavBottomLine{
    _navLineV.hidden = NO;
}

- (void)hideBorderInView:(UIView *)view{
    if ([view isKindOfClass:[UIImageView class]]
        && view.frame.size.height <= 1) {
        view.hidden = YES;
    }
    for (UIView *subView in view.subviews) {
        [self hideBorderInView:subView];
    }
}

#pragma mark - 横竖屏

- (BOOL)shouldAutorotate{
    return [self.visibleViewController shouldAutorotate];
    
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (![self.visibleViewController isKindOfClass:[UIAlertController class]]) {//iOS9 UIWebRotatingAlertController
        return [self.visibleViewController supportedInterfaceOrientations];
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}

#pragma mark - Private Method

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

