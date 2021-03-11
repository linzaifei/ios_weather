//
//  ChartUtils.m
//  weather
//
//  Created by zifei on 2021/3/11.
//

#import "ChartUtils.h"

@implementation ChartUtils

+(UIBezierPath *)pathWithPoints:(NSArray *)points isCurve:(BOOL)isCurve {
    return [self pathWithPoints:points isCurve:isCurve maxY:-10086];
}
+(UIBezierPath *)pathWithPoints:(NSArray *)points isCurve:(BOOL)isCurve maxY:(CGFloat)maxY {
    
    if (points.count <= 0) {
        return nil;
    }
    
    BOOL isClose = maxY != -10086;
    
    CGPoint p1 = [points.firstObject CGPointValue];
    
    UIBezierPath *beizer = [UIBezierPath bezierPath];
    
    if (isClose) {
        [beizer moveToPoint:CGPointMake(p1.x, maxY)];
        [beizer addLineToPoint:p1];
    }else {
        [beizer moveToPoint:p1];
    }
    
    for (int i = 1;i<points.count;i++ ) {
        CGPoint prePoint = [[points objectAtIndex:i-1] CGPointValue];
        CGPoint nowPoint = [[points objectAtIndex:i] CGPointValue];
        if (isCurve) {
            [beizer addCurveToPoint:nowPoint controlPoint1:CGPointMake((nowPoint.x+prePoint.x)/2, prePoint.y) controlPoint2:CGPointMake((nowPoint.x+prePoint.x)/2, nowPoint.y)];
        }else {
            [beizer addLineToPoint:nowPoint];
        }
        
        if (i == points.count-1 && isClose) {
            [beizer addLineToPoint:CGPointMake(nowPoint.x, maxY)];
            [beizer closePath];
        }
    }
    return beizer;
}
@end
