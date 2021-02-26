//
//  UIView+category.h
//  justiceRoad
//
//  Created by zifei on 2021/1/22.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BorderDirectionType) {
    BorderDirectionTop =0,
    BorderDirectionLeft,
    BorderDirectionBottom,
    BorderDirectionRight
};

@interface UIView (category)

//设置水平渐变
-(void)addGradientColors:(NSArray *)colors;

@end


@interface UIView(layer)
//圆角
-(void)addRadius:(CGFloat)radius;
//设置边框
-(void)addBorderWidth:(CGFloat)width color:(UIColor*)color;
//设置某一边边框
-(void)addBorderDirection:(BorderDirectionType)direction color:(UIColor*)color width:(CGFloat)width;

@end

@interface UIView (touch)
//添加点击事件
-(void)addTarget:(void(^)(void))target;
@end

@interface UIView(feedback)
//震动反馈
+(void)feedback;
@end


NS_ASSUME_NONNULL_END
