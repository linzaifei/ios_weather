//
//  ChartUtils.h
//  weather
//
//  Created by zifei on 2021/3/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChartUtils : NSObject
/**
 points [NSValue ]
 isCurve是不是圆角
 */
+(UIBezierPath *)pathWithPoints:(NSArray *)points isCurve:(BOOL)isCurve ;

/**
 points [NSValue ]
 isCurve是不是圆角
 maxY : 最大Y 合并
 */
+(UIBezierPath *)pathWithPoints:(NSArray *)points isCurve:(BOOL)isCurve maxY:(CGFloat)maxY;

@end

NS_ASSUME_NONNULL_END
