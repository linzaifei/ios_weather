//
//  ThemeTools.m
//  weather
//
//  Created by zifei on 2021/3/4.
//

#import "ThemeTools.h"
#import "Files.h"
#import "colors.h"

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

static NSString  *const THEME_KEY  = @"THEME_KEY";
@implementation ThemeTools

NSString *const THEME_JD  = @"jd";
NSString *const THEME_ZGF  = @"zgf";
NSString *const THEME_GJH  = @"gjh";

+(void)saveThemeKey:(THEME_TYPE *)key{
    
    [[NSUserDefaults standardUserDefaults] setValue:key forKey:THEME_KEY];
}

+(THEME_TYPE *)getCurrentThemeKey{
    return [[NSUserDefaults standardUserDefaults] valueForKey:THEME_KEY];
}

+(UIColor *)getColorWithName:(NSString *)name{

    THEME_TYPE  *type=  [self getCurrentThemeKey];
    NSDictionary *themeDic =  [self getThemes];
    if(!type){
        type = THEME_ZGF;
    }
    NSArray *theme = themeDic[type][@"theme"];
    
    NSString *colorStr;
    for (NSDictionary *obj in theme) {
        if([name containsString:obj[@"name"]]){
            colorStr = obj[@"color"];
            break;
        }
    }
    
    return  [UIColor colorWithHexString:colorStr alpha:1];
}

+(NSDictionary *)getThemes{
    return  [Files readLocalJsonWithName:@"colorTheme"];
}
@end
