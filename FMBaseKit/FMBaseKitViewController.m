//
//  FMBaseKitViewController.m
//  FMBaseKit
//
//  Created by mingo on 2018/6/5.
//  Copyright © 2018年 mingo. All rights reserved.
//

#import "FMBaseKitViewController.h"
#define kIsiPhone_6_6s_7_8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)


@interface FMBaseKitViewController ()
@property (nonatomic, copy) BtnActionBlock btnActionBlock;
@end

@implementation FMBaseKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageNo = 1;
    self.automaticallyAdjustsScrollViewInsets = NO;

  
}

#pragma mark - UIAlertController
-(void)fm_alertControllerTitlie:(NSString *)str1 subTitle:(NSString *)str2 {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:str1 message:str2 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (UIButton *)fm_navigationTargetController:(UIViewController *)targetViewController isLeft:(BOOL)isLeft barTitle:(NSString *)title buttonTextColor:(UIColor *)buttonTextColor itemButtonImaName:(NSString *)itemImaName btnHandler:(BtnActionBlock)btnActionBlock {
    self.btnActionBlock = btnActionBlock;
    UIButton *button = [[UIButton alloc] init];
    CGFloat imaW = 0;
    if (itemImaName.length) {
        imaW = 44;
        [button setImage:[UIImage imageNamed:itemImaName] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, 0, imaW, imaW)];
    }
    
    if (title.length) {
        [button setTitle:title forState:UIControlStateNormal];
        NSInteger index = title.length;
        CGFloat w = 18 + 16*(index - 1);
        button.frame = CGRectMake(0, 0, w + imaW, 44);
        if (kIsiPhone_6_6s_7_8) {
            [button.titleLabel setFont:[UIFont systemFontOfSize:13]];
        }else{
            [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
        }
    }
    
    if (buttonTextColor) {
        [button setTitleColor:buttonTextColor forState:UIControlStateNormal];
    }else{
        [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    }
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (isLeft) {
        targetViewController.navigationItem.leftBarButtonItem = barBtn;
    }else{
        targetViewController.navigationItem.rightBarButtonItem = barBtn;
    }
    [button addTarget:self action:@selector(fm_btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (void)fm_btnAction:(UIButton *)sender {
    if (self.btnActionBlock) {
        self.btnActionBlock(sender);
    }
}


@end
