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

FOUNDATION_EXPORT IconFont *const ic_wind;
FOUNDATION_EXPORT IconFont *const ic_rain;
FOUNDATION_EXPORT IconFont *const ic_cloud;
FOUNDATION_EXPORT IconFont *const ic_temp;

/*天气icon*/
FOUNDATION_EXPORT IconFont *const ic_154;
FOUNDATION_EXPORT IconFont *const ic_308;
FOUNDATION_EXPORT IconFont *const ic_318;
FOUNDATION_EXPORT IconFont *const ic_900;
FOUNDATION_EXPORT IconFont *const ic_509;
FOUNDATION_EXPORT IconFont *const ic_457;
FOUNDATION_EXPORT IconFont *const ic_456;

FOUNDATION_EXPORT IconFont *const ic_901;
FOUNDATION_EXPORT IconFont *const ic_508;
FOUNDATION_EXPORT IconFont *const ic_307;
FOUNDATION_EXPORT IconFont *const ic_306;
FOUNDATION_EXPORT IconFont *const ic_304;
FOUNDATION_EXPORT IconFont *const ic_310;
FOUNDATION_EXPORT IconFont *const ic_305;
FOUNDATION_EXPORT IconFont *const ic_100;

FOUNDATION_EXPORT IconFont *const ic_309;
FOUNDATION_EXPORT IconFont *const ic_303;
FOUNDATION_EXPORT IconFont *const ic_302;
FOUNDATION_EXPORT IconFont *const ic_999;
FOUNDATION_EXPORT IconFont *const ic_104;
FOUNDATION_EXPORT IconFont *const ic_501;
FOUNDATION_EXPORT IconFont *const ic_514;
FOUNDATION_EXPORT IconFont *const ic_515;

FOUNDATION_EXPORT IconFont *const ic_313;
FOUNDATION_EXPORT IconFont *const ic_502;
FOUNDATION_EXPORT IconFont *const ic_312;
FOUNDATION_EXPORT IconFont *const ic_311;
FOUNDATION_EXPORT IconFont *const ic_507;
FOUNDATION_EXPORT IconFont *const ic_315;
FOUNDATION_EXPORT IconFont *const ic_103;

FOUNDATION_EXPORT IconFont *const ic_102;
FOUNDATION_EXPORT IconFont *const ic_512;
FOUNDATION_EXPORT IconFont *const ic_513;
FOUNDATION_EXPORT IconFont *const ic_500;
FOUNDATION_EXPORT IconFont *const ic_316;
FOUNDATION_EXPORT IconFont *const ic_300;
FOUNDATION_EXPORT IconFont *const ic_511;
FOUNDATION_EXPORT IconFont *const ic_499;

FOUNDATION_EXPORT IconFont *const ic_510;
FOUNDATION_EXPORT IconFont *const ic_314;
FOUNDATION_EXPORT IconFont *const ic_317;
FOUNDATION_EXPORT IconFont *const ic_402;
FOUNDATION_EXPORT IconFont *const ic_399;
FOUNDATION_EXPORT IconFont *const ic_401;
FOUNDATION_EXPORT IconFont *const ic_400;
FOUNDATION_EXPORT IconFont *const ic_503;

FOUNDATION_EXPORT IconFont *const ic_101;
FOUNDATION_EXPORT IconFont *const ic_404;
FOUNDATION_EXPORT IconFont *const ic_504;
FOUNDATION_EXPORT IconFont *const ic_405;
FOUNDATION_EXPORT IconFont *const ic_407;
FOUNDATION_EXPORT IconFont *const ic_410;
FOUNDATION_EXPORT IconFont *const ic_153;
FOUNDATION_EXPORT IconFont *const ic_406;


FOUNDATION_EXPORT IconFont *const ic_150;
FOUNDATION_EXPORT IconFont *const ic_351;
FOUNDATION_EXPORT IconFont *const ic_403;
FOUNDATION_EXPORT IconFont *const ic_350;
FOUNDATION_EXPORT IconFont *const ic_409;
FOUNDATION_EXPORT IconFont *const ic_408;





@end



@interface UIFont (iconfont)

+(UIFont *)iconfont:(CGFloat)size;

+(UIFont *)iconfont:(CGFloat)size bold:(id)bold;
@end

@interface UIImage (iconfont)

+(UIImage*)imageIconfont:(NSString*)iconfont size:(CGFloat)size color:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
