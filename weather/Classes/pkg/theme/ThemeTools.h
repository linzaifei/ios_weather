//
//  ThemeTools.h
//  weather
//
//  Created by zifei on 2021/3/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface ThemeTools : NSObject
typedef NSString THEME_TYPE NS_STRING_ENUM;

FOUNDATION_EXPORT THEME_TYPE  * const THEME_JD;
FOUNDATION_EXPORT THEME_TYPE  *const THEME_ZGF;
FOUNDATION_EXPORT THEME_TYPE  *const THEME_GJH;

+(void)saveThemeKey:(THEME_TYPE *)key;

+(THEME_TYPE *)getCurrentThemeKey;

+(UIColor *)getColorWithName:(NSString *)name;

+(NSArray *)getThemes;

@end

NS_ASSUME_NONNULL_END
