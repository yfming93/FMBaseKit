//
//  FMBaseKitButton.h
//  FMBaseKit
//
//  Created by mingo on 2019/3/26.
//  Copyright © 2019年 mingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMBaseKitButton : UIButton
- (void)fm_startLoading;
- (void)fm_stopLoading;
@property (nonatomic, assign) BOOL isLoading;

    
@end
