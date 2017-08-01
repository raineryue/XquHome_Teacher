//
//  UIImage+Extension.m
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/1.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

/**
 根据图片名称返回一个不被渲染的原始图片
 
 @param imageName 图片名称
 @return 当前类（一张图片）
 */
+ (instancetype)imageWithRenderingModeAlwaysOriginal:(NSString *)imageName {
    UIImage *originalImage = [UIImage imageNamed:imageName];
    
    return [originalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

/**
 根据图片名称，左边拉伸比例，上边拉伸比例返回一个拉伸好的图片
 
 @param imageName 图片名称
 @param leftCapsCale 左边拉伸比例（0～1）
 @param topCapScale 上边拉伸比例 （0～1）
 @return 当前类（一张图片）
 */
+ (instancetype)imageWithStretchableImage:(NSString *)imageName leftCapScale:(CGFloat)leftCapsCale topCapScale:(CGFloat)topCapScale {
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * leftCapsCale topCapHeight:image.size.height * topCapScale];
}

/**
 裁剪一个圆形的图片
 
 @param imageName 图片名称
 @param border 圆环边宽
 @param color 圆环颜色
 @return 当前类（一张图片）
 */
+ (instancetype)imageWithName:(NSString *)imageName border:(CGFloat)border borderColor:(UIColor *)color {
    // 1.获取一个原始图片
    UIImage *oldImage = [UIImage imageNamed:imageName];
    
    // 2.根据原始图片和圆环边框宽度算出最合适的大圆尺寸
    // 获取最合适的裁剪宽高：这里应该获取图片的最短的一边
    CGFloat oldImageHW = oldImage.size.height > oldImage.size.width ? oldImage.size.width : oldImage.size.height;
    CGFloat bigCircleHW = oldImageHW + border * 2;
    
    // 3.根据大圆的尺寸开启一个图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(bigCircleHW, bigCircleHW), NO, 0.0);
    
    // 4.在上下文中画一个大圆作为头像背景
    UIBezierPath *bigCircleBeizerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, bigCircleHW, bigCircleHW)];
    
    [color set];
    
    [bigCircleBeizerPath fill];
    
    // 5.根据原始图片大小设置图像裁剪路径
    UIBezierPath *newImageBezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, oldImageHW, oldImageHW)];
    
    // 6.将裁剪路径添加到裁剪区域中
    [newImageBezierPath addClip];
    
    // 7.开始绘制新的图片
    [oldImage drawAtPoint:CGPointMake(border, border)];
    
    // 8.从上下文中获取最新绘制的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 9.关闭图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 裁剪一个圆形的图片
 
 @param image 图片
 @param border 圆环边宽
 @param color 圆环颜色
 @return 当前类（一张图片）
 */
+ (instancetype)imageWithImage:(UIImage *)image border:(CGFloat)border borderColor:(UIColor *)color {
    // 2.根据原始图片和圆环边框宽度算出最合适的大圆尺寸
    // 获取最合适的裁剪宽高：这里应该获取图片的最短的一边
    CGFloat imageHW = image.size.height > image.size.width ? image.size.width : image.size.height;
    CGFloat bigCircleHW = imageHW + border * 2;
    
    // 3.根据大圆的尺寸开启一个图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(bigCircleHW, bigCircleHW), NO, 0.0);
    
    // 4.在上下文中画一个大圆作为头像背景
    UIBezierPath *bigCircleBeizerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, bigCircleHW, bigCircleHW)];
    
    [color set];
    
    [bigCircleBeizerPath fill];
    
    // 5.根据原始图片大小设置图像裁剪路径
    UIBezierPath *newImageBezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageHW, imageHW)];
    
    // 6.将裁剪路径添加到裁剪区域中
    [newImageBezierPath addClip];
    
    // 7.开始绘制新的图片
    [image drawAtPoint:CGPointMake(border, border)];
    
    // 8.从上下文中获取最新绘制的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 9.关闭图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 将字符串转换为 png的图片名字

 @param name 图片名称
 @return 图片名称
 */
+ (NSString *)imageName:(NSString *)name {
    NSString *imageName = [NSString stringWithFormat:@"%@",name];
    
    if (![UIImage isHighResolutionDevice]) {
        imageName = [imageName stringByAppendingString:@".png"];
    }
    
    return imageName;
}

/**
 判断是否是可用版本

 @return 是否
 */
+ (BOOL)isHighResolutionDevice {
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0;;
}

@end
