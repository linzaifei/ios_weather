//
//  CloudView.h
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CloudView : BaseView

/* 主云颜色 */
@property(nonatomic,strong)UIColor *mainColor;
/* 次云颜色 */
@property(nonatomic,strong)UIColor *color;

/*云数量 默认4 */
@property(nonatomic,assign)CGFloat count;

/*云间距 默认60 */
@property(nonatomic,assign)CGFloat space;

/*延迟时间 默认2 */
@property(nonatomic,assign)CGFloat delayTime;

/*动画时间  默认 15 */
@property(nonatomic,assign)CGFloat duration;



@end

NS_ASSUME_NONNULL_END
