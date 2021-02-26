//
//  UIImage+category.m
//  justiceRoad
//
//  Created by zifei on 2021/1/21.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "UIImage+category.h"




@implementation UIImage (category)
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddRect(context, CGRectMake(0, 0,size.width, size.height));
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  image;
}

+(UIImage *)imageWithColors:(NSArray<UIColor*>*)colors size:(CGSize)size{
    NSMutableArray *cgcolorArr = [NSMutableArray array];
    for(UIColor *col in colors) {
        [cgcolorArr addObject:(id)col.CGColor];
    }
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, CGRectMake(0, 0, size.width, size.height));
    
    CGFloat locations[] = {0.0,1.0};
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef, (CFArrayRef)cgcolorArr, locations);
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(size.width, 0);
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, 0);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGColorSpaceRelease(colorSpaceRef);
    CGGradientRelease(gradientRef);
    
    UIGraphicsEndImageContext();
    
    return  image;
}/* 渐变色背景 */
+(UIImage *)imageWithColors:(NSArray<UIColor*>*)colors size:(CGSize)size direction:(Direction)dir{
    NSMutableArray *cgcolors = [NSMutableArray array];
    for (UIColor *color in colors) {
        [cgcolors addObject:(id)color.CGColor];
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat locations[] = {0.0,1.0};
    CGColorSpaceRef colorRef = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorRef, (CFArrayRef)cgcolors, locations);
    
    
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(size.width, 0);
    switch (dir) {
        case DirectionUp:
            startPoint = CGPointMake(0, size.height);
            endPoint = CGPointMake(0, 0);
            break;
        case DirectionDown:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(0, size.height);
            break;
        case DirectionLeft:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(size.width, 0);
            break;
        case DirectionRight:
            startPoint = CGPointMake(size.width, 0);
            endPoint = CGPointMake(0, 0);
            break;
            
        default:
            break;
    }
    
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return  image;
    
}

@end

   
