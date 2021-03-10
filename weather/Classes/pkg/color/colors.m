//
//  colors.m
//  justiceRoad
//
//  Created by linzaifei on 2021/1/15.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "colors.h"

@implementation colors

int const COLOR_THEME = 0x78c4d4; //主题色1

int const COLOR_BG = 0xf1f1f1;//bg

int const COLOR_BLACK = 0x000000;//黑色
int const COLOR_DARK = 0x333333;//深色
int const COLOR_GRAY = 0x666666;//未浅
int const COLOR_GREY = 0x999999;//浅色
int const COLOR_WHITE = 0xffffff;//白色
int const COLOR_LINE = 0xeeeeee;//分割线


//组件
int const COLOR_SUN_BG = 0xf7f3ea;//
int const COLOR_SUN = 0xfbca61;//
//moon
int const COLOR_MOON_BG = 0xc2c5ca;
int const COLOR_MOON = 0xfbbc36;
int const COLOR_STAR = 0x8a8e92;
//rain
int const COLOR_RAIN_BG = 0xEBF7FA;
int const COLOR_RAIN = 0x889d9f;

//rain
int const COLOR_CLOUD_BG = 0xE7EAEC;
int const COLOR_CLOUD = 0x8d99a6;
//fog
int const COLOR_FOG = 0xc0c2c5;

int const COLOR_RAIN_LINE_DASH = 0xFEFEFE;
int const COLOR_RAIN_LINE = 0xB0E7E5;
int const COLOR_RAIN_TEXT = 0xA2A2A2;


@end


@implementation UIColor (theme)


+(UIColor *)colorWithLightColor:(UIColor*)lightColor darkColor:(UIColor*)darkColor{
    if (@available(iOS 13.0, *)) {
              return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
                  if([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight){
                      return lightColor;
                  }else{
                      return darkColor;
                  }
              }];
          }
          return lightColor;
}

+(UIColor *)colorWithHexLightColor:(ColorTypes)lightColor darkColor:(ColorTypes)darkColor{
    return [self colorWithLightColor:HexRGB(lightColor) darkColor:HexRGB(darkColor)];
}

@end

@implementation UIColor(Hex)

+(UIColor *)colorWithHexString:(NSString *)hexColor alpha:(float)opacity{
    NSString * cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];

    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];

    if ([cString length] != 6) return [UIColor blackColor];

    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString * rString = [cString substringWithRange:range];

    range.location = 2;
    NSString * gString = [cString substringWithRange:range];

    range.location = 4;
    NSString * bString = [cString substringWithRange:range];

    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:opacity];
}


@end
