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

FOUNDATION_EXPORT IconFont *const ic_home;
FOUNDATION_EXPORT IconFont *const ic_live;
FOUNDATION_EXPORT IconFont *const ic_case;
FOUNDATION_EXPORT IconFont *const ic_mine;

//个人中心
FOUNDATION_EXPORT IconFont *const ic_zan; //个人中心视频点赞
FOUNDATION_EXPORT IconFont *const ic_level;//登等级
FOUNDATION_EXPORT IconFont *const ic_setting; //设置
FOUNDATION_EXPORT IconFont *const ic_right; //from 表单 right
FOUNDATION_EXPORT IconFont *const ic_camera; //编辑资料-相机

FOUNDATION_EXPORT IconFont *const ic_finish; //auth=finish
//缺省图
FOUNDATION_EXPORT IconFont *const ic_empty; //个人中心

@end



@interface UIFont (iconfont)

+(UIFont *)iconfont:(CGFloat)size;

@end

@interface UIImage (iconfont)

+(UIImage*)imageIconfont:(NSString*)iconfont size:(CGFloat)size color:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
