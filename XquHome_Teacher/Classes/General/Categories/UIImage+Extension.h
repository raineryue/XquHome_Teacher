//
//  UIImage+Extension.h
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/1.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 根据图片名称返回一个不被渲染的原始图片

 @param imageName 图片名称
 @return 当前类（一张图片）
 */
+ (instancetype)imageWithRenderingModeAlwaysOriginal:(NSString *)imageName;

/**
 根据图片名称，左边拉伸比例，上边拉伸比例返回一个拉伸好的图片

 @param imageName 图片名称
 @param leftCapsCale 左边拉伸比例（0～1）
 @param topCapScale 上边拉伸比例 （0～1）
 @return 当前类（一张图片）
 */
+ (instancetype)imageWithStretchableImage:(NSString *)imageName leftCapScale:(CGFloat)leftCapsCale topCapScale:(CGFloat)topCapScale;

/**
 裁剪一个圆形的图片

 @param imageName 图片名称
 @param border 圆环边宽
 @param color 圆环颜色
 @return 当前类（一张图片）
 */
+ (instancetype)imageWithName:(NSString *)imageName border:(CGFloat)border borderColor:(UIColor *)color;

/**
 裁剪一个圆形的图片

 @param image 图片
 @param border 圆环边宽
 @param color 圆环颜色
 @return 当前类（一张图片）
 */
+ (instancetype)imageWithImage:(UIImage *)image border:(CGFloat)border borderColor:(UIColor *)color;

@end
