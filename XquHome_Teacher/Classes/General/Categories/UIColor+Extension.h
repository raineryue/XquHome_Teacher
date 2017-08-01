//
//  UIColor+Extension.h
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/1.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 十六进制颜色转为UIColor类型颜色

 @param colorHexString 十六进制颜色
 @return UIColor颜色
 */
+ (instancetype)colorWithHexString:(NSString *)colorHexString;

@end
