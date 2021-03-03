//
//  colors.h
//  justiceRoad
//
//  Created by linzaifei on 2021/1/15.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]//十六进制转换
#define HEXRGBA(rgbValue,al) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:al] // 十六进制转换

NS_ASSUME_NONNULL_BEGIN

@interface colors : NSObject

typedef int ColorTypes NS_STRING_ENUM;

//主题色
FOUNDATION_EXPORT ColorTypes const COLOR_THEME;

//通用颜色
FOUNDATION_EXPORT ColorTypes const COLOR_BLACK;
FOUNDATION_EXPORT ColorTypes const COLOR_DARK;
FOUNDATION_EXPORT ColorTypes const COLOR_GRAY;
FOUNDATION_EXPORT ColorTypes const COLOR_GREY;
FOUNDATION_EXPORT ColorTypes const COLOR_WHITE;
FOUNDATION_EXPORT ColorTypes const COLOR_LINE;

//背景颜色
FOUNDATION_EXPORT ColorTypes const COLOR_BG;



@end


@interface UIColor(theme)

+(UIColor *)colorWithHexLightColor:(ColorTypes)lightColor darkColor:(ColorTypes)darkColor;

+(UIColor *)colorWithLightColor:(UIColor*)lightColor darkColor:(UIColor*)darkColor;


@end

NS_ASSUME_NONNULL_END
