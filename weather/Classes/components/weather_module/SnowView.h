//
//  SnowView.h
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "BaseView.h"

typedef NS_ENUM(NSInteger, SnowType){
    SnowTypeNormal = 0, //小雪
    SnowTypeMedium, //中雪
    SnowTypeLarge, //大雪
};


NS_ASSUME_NONNULL_BEGIN

@interface SnowView : BaseView

@property(nonatomic,assign)SnowType snowType;
/* 雪花颜色 */
@property(nonatomic,strong)UIColor *color;

@end

NS_ASSUME_NONNULL_END
