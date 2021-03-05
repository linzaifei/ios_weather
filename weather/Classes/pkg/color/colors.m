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
