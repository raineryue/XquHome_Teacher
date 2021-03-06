//
//  RYChoseViewController.m
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/2.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYChoseViewController.h"
#import "RYTabBarController.h"
#import "RYSaveDataLocationUtil.h"
#import "RYNewFeatureViewController.h"

@interface RYChoseViewController ()

@end

@implementation RYChoseViewController

+ (UIViewController *)choseKeyWindowRootViewController {
    // 1.创建一个window的根控制器
    // 1.1.定义一个控制器作为根控制器，根据业务创建对象
    UIViewController *rootViewController = nil;
    
    // 2.获取版本号对比版本判断进入什么界面
    // 2.1.从偏好设置中取出存入的系统版本号
    NSString *oldBundleShortVersion = [RYSaveDataLocationUtil objectForKey:RYBundleShortVersion];
    
    // 2.2.从主bundle中取出当前系统版本号
    NSString *curBundleShortVersion = [NSBundle mainBundle].infoDictionary[RYBundleShortVersion];
    
    // 2.3.根据版本号决定如何创建根控制器
    if ([curBundleShortVersion isEqualToString:oldBundleShortVersion]) {
        // 主界面
        rootViewController = [[RYTabBarController alloc] init];
    } else {
        // 存储当前版本
        [RYSaveDataLocationUtil setObject:curBundleShortVersion forKey:RYBundleShortVersion];
        
        // 新特性
        rootViewController = [[RYNewFeatureViewController alloc] init];
    }
    
    return rootViewController;
}


@end
