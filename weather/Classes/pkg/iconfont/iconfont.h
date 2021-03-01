//
//  iconfont.h
//  justiceRoad
//
//  Created by zifei on 2021/1/21.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface iconfont : NSObject
typedef NSString IconFont NS_STRING_ENUM;

//tabbar
FOUNDATION_EXPORT IconFont *const ic_home;
FOUNDATION_EXPORT IconFont *const ic_mine;


@end



@interface UIFont (iconfont)

+(UIFont *)iconfont:(CGFloat)size;

@end

@interface UIImage (iconfont)

+(UIImage*)imageIconfont:(NSString*)iconfont size:(CGFloat)size color:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
