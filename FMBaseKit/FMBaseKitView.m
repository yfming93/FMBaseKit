//
//  FMBaseKitView.m
//  FMBaseKit
//
//  Created by mingo on 2019/3/15.
//  Copyright © 2019年 Fleeming. All rights reserved.
//

#import "FMBaseKitView.h"

@implementation FMBaseKitView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self fm_addInit];
        
    }
    return self;
}
- (void)fm_addInit {
    
}



- (void)fm_setBorderColor:(UIColor *)color borderWidth:(CGFloat)width radius:(CGFloat)radius {
    [self.layer setBorderWidth:(width)];
    [self.layer setBorderColor:[color CGColor]];
    if (radius) {
        [self.layer setCornerRadius:(radius)];
        [self.layer setMasksToBounds:YES];
        
    }
}


@end
