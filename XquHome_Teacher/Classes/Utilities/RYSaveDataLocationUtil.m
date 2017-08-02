//
//  RYSaveDataLocationUtil.m
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/2.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYSaveDataLocationUtil.h"

@implementation RYSaveDataLocationUtil

/**
 将对象按照某个Key归档存储到本地
 
 @param object 对象
 @param key 数据标示
 */
+ (void)archivedDataWithRootObject:(NSObject *)object key:(NSString *)key {
    // 将对象归档
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
    
    // 将数据存储
    [RYSaveDataLocationUtil setObject:data forKey:key];
}

/**
 将某个Key解档成对象
 
 @param key 数据标示
 @return 对象
 */
+ (nullable id)unarchiveObjectWithKey:(NSString *)key {
    // 根据标示取出数据
    NSData *data = [RYSaveDataLocationUtil objectForKey:key];
    
    // 解档并返取出的回数据
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

/**
 按照名称取出数据
 
 @param defaultName 存储数据的名称
 */
+ (nullable id)objectForKey:(NSString *)defaultName {
    // 取出数据
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

/**
 按照名称存储数据
 
 @param value 数据值
 @param defaultName 数据的名称
 */
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName {
    // 保存数据
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    
    // 将数据同步
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 根据标示删除数据
 
 @param key 标示
 */
+ (void)removeObjectForKey:(NSString *)key {
    NSDictionary *userDefaultsDictionary = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    
    for (NSString *keyWord in [userDefaultsDictionary allKeys]) {
        NSLog(@"===================keyWord:[%@]", keyWord);
        
        if ([key isEqualToString:keyWord]) {
            // 置空偏好设置
            [[NSUserDefaults standardUserDefaults] setObject:nil forKey:key];
            
            // 删除标示数据
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        }
    }
    
    RYLog(@"===================userDefaultsDictionary:[%@]", userDefaultsDictionary);
    
    // 将数据同步
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
