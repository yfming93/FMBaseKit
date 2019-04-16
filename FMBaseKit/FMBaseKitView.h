//
//  FMBaseKitView.h
//  FMBaseKit
//
//  Created by mingo on 2019/3/15.
//  Copyright © 2019年 Fleeming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMBaseKitView : UIView
@property (nonatomic, assign) CGFloat radius;

- (void)fm_setBorderColor:(UIColor *)color borderWidth:(CGFloat)width radius:(CGFloat)radius;
@end
