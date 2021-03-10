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


//动画组件颜色
//sun
FOUNDATION_EXPORT ColorTypes const COLOR_SUN;
FOUNDATION_EXPORT ColorTypes const COLOR_SUN_BG;
//moon
FOUNDATION_EXPORT ColorTypes const COLOR_MOON_BG;
FOUNDATION_EXPORT ColorTypes const COLOR_MOON;
FOUNDATION_EXPORT ColorTypes const COLOR_STAR;

//rain
FOUNDATION_EXPORT ColorTypes const COLOR_RAIN;
FOUNDATION_EXPORT ColorTypes const COLOR_RAIN_BG;

//cloud
FOUNDATION_EXPORT ColorTypes const COLOR_CLOUD;
FOUNDATION_EXPORT ColorTypes const COLOR_CLOUD_BG;

//fog
FOUNDATION_EXPORT ColorTypes const COLOR_FOG;



//chart
FOUNDATION_EXPORT ColorTypes const COLOR_RAIN_LINE_DASH;
FOUNDATION_EXPORT ColorTypes const COLOR_RAIN_LINE;
FOUNDATION_EXPORT ColorTypes const COLOR_RAIN_TEXT;


@end


@interface UIColor(theme)

+(UIColor *)colorWithHexLightColor:(ColorTypes)lightColor darkColor:(ColorTypes)darkColor;

+(UIColor *)colorWithLightColor:(UIColor*)lightColor darkColor:(UIColor*)darkColor;


@end

@interface UIColor (Hex)
+(UIColor *)colorWithHexString:(NSString *)hexColor alpha:(float)opacity;

@end

NS_ASSUME_NONNULL_END
