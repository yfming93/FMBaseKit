//
//  FMBaseKitButton.m
//  FMBaseKit
//
//  Created by mingo on 2019/3/26.
//  Copyright © 2019年 袁凤鸣. All rights reserved.
//
//  Blog：http://www.yfmingo.cn  Email：yfmingo@163.com


#import "FMBaseKitButton.h"

@interface FMBaseKitButton ()

@property (nonatomic, strong) UIActivityIndicatorView * indecator;
@property (nonatomic, strong) NSString * text;

@end

@implementation FMBaseKitButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self fm_subInit];
    }
    return self;
}
    
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self fm_subInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self fm_subInit];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self fm_subInit];
}

- (void)fm_subInit {
    [self commentInit];
}

- (void)fm_startLoading {
    self.titleLabel.alpha = 0.01;
    [self.indecator startAnimating];
}
- (void)fm_stopLoading {
    self.titleLabel.alpha = 1.0;
    [self.indecator stopAnimating];
}
    
-(void)setIsLoading:(BOOL)isLoading {
    _isLoading = isLoading;
    if (isLoading) {
        [self fm_startLoading];
    }else{
        [self fm_stopLoading];
    }
}
    

- (void)commentInit {
    self.indecator.hidden = YES;
    self.indecator.userInteractionEnabled = NO;
//    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
}
    
- (UIActivityIndicatorView *)indecator {
    if (_indecator == nil) {
        _indecator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        //        UIActivityIndicatorView 不能通过设置frame的方式来修改大小
        //        需求:需要把显示的UIActivityIndicatorView显示得比预定义的小,实现的方式是通过transform来修改显示UIActivityIndicatorView的显示大小
        CGAffineTransform transform = CGAffineTransformMakeScale(.8f, .8f);
        _indecator.transform = transform;
        _indecator.center = self.center;
        _indecator.frame = CGRectMake((self.frame.size.width - _indecator.frame.size.width)/2, (self.frame.size.height - _indecator.frame.size.height)/2, _indecator.frame.size.width, _indecator.frame.size.height);
//        self.indecator.translatesAutoresizingMaskIntoConstraints = NO; /// 设置后菊花错误的 跑到(0,0)点了
        [self addSubview:_indecator];

    }

    return _indecator;
}



@end
