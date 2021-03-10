//
//  RainChartView.m
//  weather
//
//  Created by zifei on 2021/3/10.
//

#import "RainChartView.h"

@implementation RainChartView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self chart];
    }
    return self;
}

-(void)chart{
    self.row = 6;
    self.col = 4;
    self.bottom_space = 50;
    self.space = 20;
    self.lineWidth = 1;
    self.backgroundColor = [UIColor colorWithHexLightColor:COLOR_WHITE darkColor:COLOR_WHITE];
    self.lineColor = [UIColor colorWithHexLightColor:COLOR_RAIN_LINE darkColor:COLOR_RAIN_LINE];
    self.lineDashColor = [UIColor colorWithHexLightColor:COLOR_LINE darkColor:COLOR_LINE];
    
    self.rowColor = [UIColor colorWithHexLightColor:COLOR_RAIN_TEXT darkColor:COLOR_RAIN_TEXT];
    self.colColor =[UIColor colorWithHexLightColor:COLOR_RAIN_LINE darkColor:COLOR_RAIN_LINE];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.backgroundColor = [UIColor orangeColor].CGColor
    ;
    shapeLayer.frame =CGRectMake(0, 0, 400, 280);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 180)];
    [self getControlPointx0:40 andy0:200 x1:50 andy1:100 x2:80 andy2:150 x3:140 andy3:180 path:path];
    
    shapeLayer.path = path.CGPath;
    shapeLayer.lineWidth = 5;
    shapeLayer.strokeColor = [UIColor  redColor].CGColor;
    [self.layer addSublayer:shapeLayer];
    
    
    
    
}

- (void)getControlPointx0:(CGFloat)x0 andy0:(CGFloat)y0
                       x1:(CGFloat)x1 andy1:(CGFloat)y1
                       x2:(CGFloat)x2 andy2:(CGFloat)y2
                       x3:(CGFloat)x3 andy3:(CGFloat)y3
                     path:(UIBezierPath*) path{
    CGFloat smooth_value =0.6;
    CGFloat ctrl1_x;
    CGFloat ctrl1_y;
    CGFloat ctrl2_x;
    CGFloat ctrl2_y;
    CGFloat xc1 = (x0 + x1) /2.0;
    CGFloat yc1 = (y0 + y1) /2.0;
    CGFloat xc2 = (x1 + x2) /2.0;
    CGFloat yc2 = (y1 + y2) /2.0;
    CGFloat xc3 = (x2 + x3) /2.0;
    CGFloat yc3 = (y2 + y3) /2.0;
    CGFloat len1 = sqrt((x1-x0) * (x1-x0) + (y1-y0) * (y1-y0));
    CGFloat len2 = sqrt((x2-x1) * (x2-x1) + (y2-y1) * (y2-y1));
    CGFloat len3 = sqrt((x3-x2) * (x3-x2) + (y3-y2) * (y3-y2));
    CGFloat k1 = len1 / (len1 + len2);
    CGFloat k2 = len2 / (len2 + len3);
    CGFloat xm1 = xc1 + (xc2 - xc1) * k1;
    CGFloat ym1 = yc1 + (yc2 - yc1) * k1;
    CGFloat xm2 = xc2 + (xc3 - xc2) * k2;
    CGFloat ym2 = yc2 + (yc3 - yc2) * k2;
    ctrl1_x = xm1 + (xc2 - xm1) * smooth_value + x1 - xm1;
    ctrl1_y = ym1 + (yc2 - ym1) * smooth_value + y1 - ym1;
    ctrl2_x = xm2 + (xc2 - xm2) * smooth_value + x2 - xm2;
    ctrl2_y = ym2 + (yc2 - ym2) * smooth_value + y2 - ym2;
    [path addCurveToPoint:CGPointMake(x2, y2) controlPoint1:CGPointMake(ctrl1_x, ctrl1_y) controlPoint2:CGPointMake(ctrl2_x, ctrl2_y)];
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;

    CGFloat tb_space = (height-self.space-self.bottom_space)/self.col;
    CGFloat lr_space = (width-2*self.space)/self.col;
     
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    //绘制背景虚线
    CGContextSetLineWidth(ctx, self.lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGFloat lengths[] = {10,10};
    CGContextSetLineDash(ctx, 0, lengths, 2);
    CGContextSetStrokeColorWithColor(ctx, self.lineDashColor.CGColor);
   
    for (int i =0 ; i<=self.col; i++) {
        CGContextMoveToPoint(ctx, self.space,tb_space*i + self.space);
        CGContextAddLineToPoint(ctx,width-self.space, tb_space*i +self.space);
    }
   
    for (int i =0 ; i<=self.row; i++) {
        CGContextMoveToPoint(ctx, self.space +lr_space*i, self.space);
        CGContextAddLineToPoint(ctx,self.space +lr_space*i, height-self.bottom_space);
    }
    CGContextDrawPath(ctx, kCGPathStroke);
 
    //绘制等级虚线
    CGContextSetStrokeColorWithColor(ctx, self.lineColor.CGColor);
    CGPoint x0 = CGPointMake(self.space, tb_space*1.5 + self.space);
    CGPoint y0 = CGPointMake(width - self.space, tb_space*1.5 + self.space);
    
    CGPoint x1 = CGPointMake(self.space, tb_space*2.5 + self.space);
    CGPoint y1 = CGPointMake(width - self.space, tb_space*2.5 + self.space);
    
    CGPoint x2 = CGPointMake(self.space,height-tb_space/2-self.bottom_space );
    CGPoint y2 = CGPointMake(width-self.space, height-tb_space/2-self.bottom_space);
    
    CGContextMoveToPoint(ctx, x0.x,x0.y);
    CGContextAddLineToPoint(ctx,y0.x,y0.y );
    CGContextMoveToPoint(ctx, x1.x,x1.y);
    CGContextAddLineToPoint(ctx,y1.x,y1.y );
    CGContextMoveToPoint(ctx, x2.x,x2.y);
    CGContextAddLineToPoint(ctx,y2.x,y2.y );
    CGContextDrawPath(ctx, kCGPathStroke);
    

    //绘制垂直方向图形
    UIFont  *font = [UIFont boldSystemFontOfSize:15.0];
    [@"大" drawInRect:CGRectMake(x0.x,x0.y-20, 20, 20) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:self.colColor}];
    [@"中" drawInRect:CGRectMake(x1.x,x1.y-20, 20, 20) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:self.colColor}];
    [@"小" drawInRect:CGRectMake(x2.x,x2.y-20, 20, 20) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:self.colColor}];
    
    //绘制水平方向值
    for (int i =0 ; i<=self.row; i++) {
        CGPoint end = CGPointMake(self.space +lr_space*i, height-self.bottom_space);
        NSString *s = i==0?@"now":  [NSString stringWithFormat:@"%.1fh",0.5*i];
        [s drawInRect:CGRectMake(end.x-10,end.y+10, 30, 20) withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0],NSForegroundColorAttributeName:self.rowColor}];
    }
    
    
    //绘制图表
    CGFloat x = height - self.bottom_space; // 表示
    CGFloat average = (width - self.space*2)/self.values.count;//水平平均距离
    
    
    
 

}


@end
