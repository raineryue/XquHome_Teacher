//
//  RYApplicationMacro.h
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/1.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#ifndef RYApplicationMacro_h
#define RYApplicationMacro_h

// 版本信息
#define RYBundleShortVersion                @"CFBundleShortVersionString"

// 主Window
#define RYKeyWindow                         [UIApplication sharedApplication].keyWindow

// 系统Frame
#define RYScreenBounds                      [UIScreen mainScreen].bounds
#define RYScreenWidth                       RYScreenBounds.size.width
#define RYScreenHeight                      RYScreenBounds.size.height
#define RYSelfBoundsWidth                   self.view.bounds.size.width
#define RYSelfBoundsHeight                  self.view.bounds.size.height

// 颜色
#define RYColorForHex(_potin)               [UIColor colorWithHexString:(_potin)]
#define RYColorForRGB(r, g, b)              [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]

// 中文字体
#define RYChineseFontSize(CGFloat)          [UIFont fontWithName:@"PingFangSC-Regular" size:CGFloat]
#define RYChineseBoldFontSize(CGFloat)      [UIFont fontWithName:@"PingFangSC-Regular" size:CGFloat]

// 英文 数字 符号 字体
#define RYEnglishLightFontSize(CGFloat)     [UIFont fontWithName:@"SFUIDisplay-Light" size:CGFloat]
#define RYEnglishBoldFontSize(CGFloat)      [UIFont fontWithName:@"SFUIDisplay-Bold" size:CGFloat]
#define RYEnglishMediumFontSize(CGFloat)    [UIFont fontWithName:@"SFUIDisplay-Medium" size:CGFloat]
#define RYEnglishRegularFontSize(CGFloat)   [UIFont fontWithName:@"SFUIDisplay" size:CGFloat]

// 弱指针Self
#define RYWeakSelf(self)                    __weak __typeof(&*self)weakSelf = self;

// 打印
#ifdef DEBUG
#define RYLog(...) NSLog(__VA_ARGS__)
#else
#define RYLog(...)
#endif

#endif /* RYApplicationMacro_h */
