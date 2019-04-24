//
//  FMBaseKitModel.m
//  FMBaseKit
//
//  Created by mingo on 2018/6/5.
//  Copyright © 2018年 mingo. All rights reserved.
//

#import "FMBaseKitModel.h"

@implementation FMBaseKitModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"description_field":@"description"
             };
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
