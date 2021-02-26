//
//  colors.m
//  justiceRoad
//
//  Created by linzaifei on 2021/1/15.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "colors.h"

@implementation colors

int const COLOR_THEME = 0x2B3EDC; //主题色1
int const COLOR_THEME1 = 0x2B3EDC;//主题色2
int const COLOR_BLACK = 0x000000;//黑色
int const COLOR_DARK = 0x333333;//深色
int const COLOR_GRAY = 0x666666;//未浅
int const COLOR_GREY = 0x999999;//浅色
int const COLOR_WHITE = 0xffffff;//白色
int const COLOR_LINE = 0xeeeeee;//分割线

int const COLOR_MINE = 0x108BFF;
int const COLOR_BG_MINE = 0x0084FF;

int const COLOR_PRO = 0x8C8C8C;





//bg
int const COLOR_BG = 0xf1f1f1;
int const COLOR_BG1 = 0xF8F8F8;


//from
int const COLOR_FROM_TITLE = 0x363636;
int const COLOR_FROM_TEXT = 0xe7e7e7;
int const COLOR_FROM_BUTTON = 0xE0EDFA;

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
