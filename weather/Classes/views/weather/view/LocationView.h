//
//  LocationView.h
//  weather
//
//  Created by zifei on 2021/3/9.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocationView : BaseView
@property(nonatomic,strong,readonly)UILabel *cityLabel;
@property(nonatomic,strong,readonly)UILabel *areaLabel;
@end

NS_ASSUME_NONNULL_END
