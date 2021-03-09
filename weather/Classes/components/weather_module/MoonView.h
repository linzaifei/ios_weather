//
//  MoonView.h
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MoonView : BaseView
/* 月亮半径 默认50*/
@property(nonatomic,assign)CGFloat radius;

/* 间距 默认 30 */
@property(nonatomic,assign)CGFloat space;


/* 月亮颜色 默认 orange  */
@property(nonatomic,strong)UIColor *color;

/* 星星数目 */
@property(nonatomic,assign,readonly)int count ;

/* 星星颜色 */
@property(nonatomic,strong)UIColor *starColor ;



@end

NS_ASSUME_NONNULL_END
