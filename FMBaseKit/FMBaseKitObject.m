//
//  FMBaseKitObject.m
//  FMBaseKit
//
//  Created by mingo on 2019/3/22.
//  Copyright © 2019年 袁凤鸣. All rights reserved.
//

#import "FMBaseKitObject.h"

@implementation FMBaseKitObject

- (instancetype)fm_initWithObjects:fmobjects, ... {
    /// 参考 https://segmentfault.com/a/1190000004553716
    
    NSMutableArray *objArray = [NSMutableArray array];
    va_list args;
    va_start(args, fmobjects);
    if (fmobjects) {
        [objArray addObject:fmobjects];
        while (1) {
            NSString *otherObject = va_arg(args, NSString *);
            if (otherObject == nil) {
                break;
            } else {
                [objArray addObject:otherObject];
            }
        }
    }
    va_end(args);
    
    //...后面略
    return self;

}


/**
 开启一个定时器
 
 @param target 定时器持有者
 @param timeInterval 执行间隔时间
 @param handler 重复执行事件
 */
void dispatchTimer(id target, double timeInterval,void (^handler)(dispatch_source_t timer))
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer =dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), (uint64_t)(timeInterval *NSEC_PER_SEC), 0);
    // 设置回调
    __weak __typeof(target) weaktarget  = target;
    dispatch_source_set_event_handler(timer, ^{
        if (!weaktarget)  {
            dispatch_source_cancel(timer);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (handler) handler(timer);
            });
        }
    });
    // 启动定时器
    dispatch_resume(timer);
}

@end
