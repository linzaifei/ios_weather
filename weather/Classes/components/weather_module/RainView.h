//
//  RainView.h
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "BaseView.h"

typedef NS_ENUM(NSInteger, RainType){
    RainTypeNormal=0, //下雨
    RainTypeMedium, //中雨
    RainTypeLarge, //大雨
};


NS_ASSUME_NONNULL_BEGIN

@interface RainView : BaseView

@property(nonatomic,assign)RainType rainType;

/* 雨滴颜色 clear-orange */
@property(nonatomic,strong)NSArray<UIColor *> *colors;

@property(nonatomic,strong)UIColor *color;

@end

NS_ASSUME_NONNULL_END
