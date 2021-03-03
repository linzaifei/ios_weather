//
//  PreviewView.h
//  weather
//
//  Created by zifei on 2021/3/2.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PreviewView : BaseView

@property(nonatomic,copy)NSArray *dataArr;

@end

@interface PreviewItemView : BaseView

/*天气温度字 晴 多云 雨 */
@property(nonatomic,strong,readonly)UILabel *tempWordLabel;

/*天气温度区间 */
@property(nonatomic,strong,readonly)UILabel *tempLabel;

/*当前日期 今天 明天 */
@property(nonatomic,strong,readonly)UILabel *timeLabel;

@end

NS_ASSUME_NONNULL_END
