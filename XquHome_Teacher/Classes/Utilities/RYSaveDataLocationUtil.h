//
//  RYSaveDataLocationUtil.h
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/2.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RYSaveDataLocationUtil : NSObject

/**
 将对象按照某个Key归档存储到本地
 
 @param object 对象
 @param key 数据标示
 */
+ (void)archivedDataWithRootObject:(NSObject *_Nonnull)object key:(NSString *_Nonnull)key;

/**
 将某个Key解档成对象
 
 @param key 数据标示
 @return 对象
 */
+ (nullable id)unarchiveObjectWithKey:(NSString *_Nonnull)key;

/**
 按照名称取出数据
 
 @param defaultName 存储数据的名称
 */
+ (nullable id)objectForKey:(NSString *_Nonnull)defaultName;

/**
 按照名称存储数据
 
 @param value 数据值
 @param defaultName 数据的名称
 */
+ (void)setObject:(nullable id)value forKey:(NSString *_Nonnull)defaultName;

/**
 根据标示删除数据
 
 @param key 标示
 */
+ (void)removeObjectForKey:(NSString *_Nonnull)key;


@end
