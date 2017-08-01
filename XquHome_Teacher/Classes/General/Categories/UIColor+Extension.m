//
//  UIColor+Extension.m
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/1.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

/**
 十六进制颜色转为UIColor类型颜色
 
 @param colorHexString 十六进制颜色
 @return UIColor颜色
 */
+ (instancetype)colorWithHexString:(NSString *)colorHexString {
    // 过滤特殊字符，并且专为大写
    NSString *cString = [[colorHexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // 判断长度是否为十六进制颜色长度
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // 如果有0X则截取掉，如果有#则截取掉，否则直接用
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 定义范围
    NSRange range;
    
    range.location = 0;
    range.length = 2;
    
    // r
    NSString *rString = [cString substringWithRange:range];
    
    // g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    // b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // 定义rgb变量
    unsigned int r, g, b;
    
    // 获取rgb值
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    // 返回颜色
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
