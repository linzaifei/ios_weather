//
//  ThemeTools.m
//  weather
//
//  Created by zifei on 2021/3/4.
//

#import "ThemeTools.h"
#import "Files.h"

static const NSString * THEME_KEY = @"THEME_KEY";
@implementation ThemeTools

NSString *const THEME_JD  = @"jd";
NSString *const THEME_ZGF  = @"zgf";
NSString *const THEME_GJH  = @"gjh";


+(void)saveTheme:(THEME_TYPE *)theme{
    
    
    
}

+(THEME_TYPE *)getCurrentTheme{
    
// [[NSUserDefaults standardUserDefaults] setObject:<#(nullable id)#> forKey:THEME_KEY]
    
    return THEME_JD;
}

+(NSArray *)getThemes{
    return  [Files readLocalJsonWithName:@"colorTheme.json"];
}
@end
