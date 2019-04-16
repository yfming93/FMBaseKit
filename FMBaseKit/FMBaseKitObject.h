//
//  FMBaseKitObject.h
//  FMBaseKit
//
//  Created by mingo on 2019/3/22.
//  Copyright © 2019年 袁凤鸣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMBaseKitObject : NSObject
- (instancetype)fm_initWithObjects:fmobjects, ... ;

/**
 开启一个定时器
 
 @param target 定时器持有者
 @param timeInterval 执行间隔时间
 @param handler 重复执行事件
 */
void dispatchTimer(id target, double timeInterval,void (^handler)(dispatch_source_t timer));
@end
