//
//  FMBaseKitViewController.m
//  FMBaseKit
//
//  Created by mingo on 2018/6/5.
//  Copyright © 2018年 mingo. All rights reserved.
//

#import "FMBaseKitViewController.h"

@interface FMBaseKitViewController ()
@property (nonatomic, strong) NSMutableArray <BtnActionBlock>*arrBlocks;

@end

@implementation FMBaseKitViewController

- (NSMutableArray *)arrBlocks{
    if (!_arrBlocks) {
        _arrBlocks =[[NSMutableArray alloc] init];
    }
    return _arrBlocks;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageNo = 1;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.modalPresentationStyle = UIModalPresentationFullScreen;

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
    BtnActionBlock handler = btnActionBlock;
    UIButton *button = [[UIButton alloc] init];
    button.tag = self.arrBlocks.count;
    [self.arrBlocks addObject:handler];
    CGFloat imaW = 0;
    if (itemImaName.length) {
        imaW = 44;
        [button setImage:[UIImage imageNamed:itemImaName] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, 0, imaW, imaW)];
    }
    
    if (title.length) {
        [button setTitle:title forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        CGSize textSize1 = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        button.frame = CGRectMake(0, 0, textSize1.width  + imaW, 44);

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
    if (self.arrBlocks[sender.tag]) {
        self.arrBlocks[sender.tag](sender);
    }
}



- (NSMutableArray *)fm_navigationTargetControlle:(UIViewController *)targetViewController isLeft:(BOOL)isLeft barTitle:(NSString *)title buttonTextColor:(UIColor *)buttonTextColor itemButtonImaName:(NSString *)itemImaName btnHandler:(BtnActionBlock)btnActionBlock {
    BtnActionBlock handler = btnActionBlock;
    UIButton *button = [[UIButton alloc] init];
    button.tag = self.arrBlocks.count;
    [self.arrBlocks addObject:handler];
    CGFloat imaW = 0;
    if (itemImaName.length) {
        imaW = 44;
        [button setImage:[UIImage imageNamed:itemImaName] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, 0, imaW, imaW)];
    }
    
    if (title.length) {
        [button setTitle:title forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, button.titleLabel.frame.size.width  + imaW, 44);
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
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



@end
