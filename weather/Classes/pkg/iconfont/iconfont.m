//
//  iconfont.m
//  justiceRoad
//
//  Created by zifei on 2021/1/21.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "iconfont.h"

@implementation iconfont

NSString *const ic_home  = @"\U0000e671";
NSString *const ic_live  = @"\U0000e683";
NSString *const ic_case  = @"\U0000e675";
NSString *const ic_mine  = @"\U0000e682";

NSString *const ic_zan  = @"\U0000e63d";//视频中心点赞
NSString *const ic_level  = @"\U0000e602";//等级
NSString *const ic_setting  = @"\U0000e61f";//等级
NSString *const ic_right  = @"\U0000e600";
NSString *const ic_camera  = @"\U0000e67e";
NSString *const ic_finish  = @"\U0000e606";


NSString *const ic_empty  = @"\U0000e697";

@end

@implementation UIFont (iconfont)
+(UIFont *)iconfont:(CGFloat)size{
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
