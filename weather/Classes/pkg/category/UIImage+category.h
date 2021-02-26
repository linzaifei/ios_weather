//
//  UIImage+category.h
//  justiceRoad
//
//  Created by zifei on 2021/1/21.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,Direction){
    DirectionUp,
    DirectionDown,
    DirectionLeft,
    DirectionRight,
};

NS_ASSUME_NONNULL_BEGIN


@interface UIImage (category)
/* 颜色生成图片 */
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/* 渐变色背景 */
+(UIImage *)imageWithColors:(NSArray<UIColor*>*)colors size:(CGSize)size direction:(Direction)dir;


@end

NS_ASSUME_NONNULL_END
