//
//  iconfont.m
//  justiceRoad
//
//  Created by zifei on 2021/1/21.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "iconfont.h"

@implementation iconfont

NSString *const ic_home  = @"\U0000e982";
NSString *const ic_mine  = @"\U0000e983";

/*----*/
NSString *const ic_wind  = @"\U0000e912";
NSString *const ic_rain  = @"\U0000e913";
NSString *const ic_cloud  = @"\U0000e914";
NSString *const ic_temp  = @"\U0000e915";
NSString *const ic_search  = @"\U0000e63f";


/*----*/
NSString *const ic_154 = @"\U0000e635";
NSString *const ic_308 = @"\U0000e636";
NSString *const ic_318 = @"\U0000e637";
NSString *const ic_900 = @"\U0000e638";
NSString *const ic_509 = @"\U0000e639";
NSString *const ic_457 = @"\U0000e63a";
NSString *const ic_309 = @"\U0000e63b";
NSString *const ic_456 = @"\U0000e63c";
NSString *const ic_901 = @"\U0000e63d";
NSString *const ic_508 = @"\U0000e63e";
NSString *const ic_307 = @"\U0000e600";
NSString *const ic_306 = @"\U0000e601";
NSString *const ic_304 = @"\U0000e602";
NSString *const ic_310 = @"\U0000e603";
NSString *const ic_305 = @"\U0000e604";
NSString *const ic_100 = @"\U0000e605";
NSString *const ic_303 = @"\U0000e607";
NSString *const ic_302 = @"\U0000e608";
NSString *const ic_104 = @"\U0000e60a";
NSString *const ic_501 = @"\U0000e60b";
NSString *const ic_514 = @"\U0000e60c";
NSString *const ic_515 = @"\U0000e60d";
NSString *const ic_313 = @"\U0000e60e";
NSString *const ic_502 = @"\U0000e60f";
NSString *const ic_312 = @"\U0000e611";
NSString *const ic_311 = @"\U0000e612";
NSString *const ic_507 = @"\U0000e613";
NSString *const ic_315 = @"\U0000e614";
NSString *const ic_103 = @"\U0000e615";
NSString *const ic_102 = @"\U0000e616";
NSString *const ic_512 = @"\U0000e617";
NSString *const ic_513 = @"\U0000e618";
NSString *const ic_500 = @"\U0000e619";
NSString *const ic_316 = @"\U0000e61a";
NSString *const ic_300 = @"\U0000e61b";
NSString *const ic_511 = @"\U0000e61c";
NSString *const ic_499 = @"\U0000e61d";
NSString *const ic_510 = @"\U0000e61e";
NSString *const ic_314 = @"\U0000e61f";
NSString *const ic_317 = @"\U0000e620";
NSString *const ic_402 = @"\U0000e621";
NSString *const ic_399 = @"\U0000e622";
NSString *const ic_401 = @"\U0000e623";
NSString *const ic_400 = @"\U0000e624";
NSString *const ic_503 = @"\U0000e625";
NSString *const ic_101 = @"\U0000e626";
NSString *const ic_404 = @"\U0000e627";
NSString *const ic_504 = @"\U0000e628";
NSString *const ic_405 = @"\U0000e629";
NSString *const ic_407 = @"\U0000e62a";
NSString *const ic_410 = @"\U0000e62b";
NSString *const ic_153 = @"\U0000e62c";
NSString *const ic_406 = @"\U0000e62d";
NSString *const ic_999 = @"\U0000e62e";
NSString *const ic_150 = @"\U0000e62f";
NSString *const ic_351 = @"\U0000e630";
NSString *const ic_403 = @"\U0000e631";
NSString *const ic_350 = @"\U0000e632";
NSString *const ic_409 = @"\U0000e633";
NSString *const ic_408 = @"\U0000e634";

@end

@implementation UIFont (iconfont)
+(UIFont *)iconfont:(CGFloat)size{
    UIFont *font = [UIFont fontWithName:@"iconfont" size:size];
    return font?font :[UIFont systemFontOfSize:size];
}

+(UIFont *)iconfont:(CGFloat)size bold:(id)bold{
    UIFont *font = [UIFont fontWithName:@"iconfont" size:size];

    
    return font?font :[UIFont systemFontOfSize:size];
}
@end

@implementation UIImage (iconfont)


+(UIImage*)imageIconfont:(NSString*)iconfont size:(CGFloat)size color:(UIColor*)color{
    
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = size*scale;    
    UIFont *font = [UIFont iconfont:realSize];
    UIGraphicsBeginImageContext(CGSizeMake(realSize, realSize));
    CGContextRef context = UIGraphicsGetCurrentContext();
    if([iconfont respondsToSelector:@selector(drawInRect:withAttributes:)]){
        [iconfont drawAtPoint:CGPointZero withAttributes:@{
            NSFontAttributeName:font,NSForegroundColorAttributeName: color
        }];
    }else{
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, color.CGColor);
        [iconfont drawAtPoint:CGPointMake(0, 0) withFont:font];
    #pragma clang pop
    }
    
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();

    return image;
}

@end
