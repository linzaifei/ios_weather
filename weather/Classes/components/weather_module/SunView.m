//
//  SunView.m
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "SunView.h"
@interface SunView()
@property(nonatomic ,strong)CAShapeLayer *sunLayer ;
@property(nonatomic ,strong)CAShapeLayer *lineLayer ;
@property(nonatomic ,strong)CABasicAnimation *animation;

@end

@implementation SunView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self setUI];
    }
    return self;
}

-(void)setUI{
    //设置默认属性
    self.sunColor = [UIColor orangeColor];
    self.sunSize = 50;
    self.lineColor = [UIColor orangeColor];
    self.lineDash = @[@20,@15];
    self.lineHeight = 8;
    self.angle = 30;
    self.duration = 40;
    
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    
    self.sunLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.sunLayer];
    
    self.lineLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.lineLayer];
    
    self.animation = [CABasicAnimation animation];
    
    
}



- (void)drawRect:(CGRect)rect {
  
    //光线角度 30度(每30度发射一次光线)
    CGFloat space = 40;//边距
    CGFloat height= rect.size.height;
    CGFloat width = rect.size.width;
    
    // 大太阳
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint center = CGPointMake(width-self.sunSize-space,self.sunSize+space);
    [path addArcWithCenter:center radius:self.sunSize startAngle:0 endAngle:M_PI*2 clockwise:NO];
    
    self.sunLayer.path  = path.CGPath;
    self.sunLayer.fillColor = self.sunColor.CGColor;
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    for (int i=0; i<360/self.angle; i++) {
        CGFloat ang = self.angle*i * M_PI / 180;
        CGFloat x0 = center.x + (self.sunSize +10) * cos(ang);
        CGFloat y0 = center.y + (self.sunSize +10) * sin(ang);
        CGFloat x1 = center.x + width * cos(ang);
        CGFloat y1 = center.y + width * sin(ang);
        [linePath moveToPoint:CGPointMake(x0, y0)];
        [linePath addLineToPoint:CGPointMake(x1, y1)];
    }
    
    //太阳光线
    self.lineLayer.path = linePath.CGPath;
    self.lineLayer.lineDashPattern = self.lineDash;//画虚线
    self.lineLayer.strokeColor = self.lineColor.CGColor;
    self.lineLayer.lineWidth = self.lineHeight;
    self.lineLayer.lineCap = kCALineCapRound;
    self.lineLayer.lineJoin = kCALineJoinRound;
    self.lineLayer.fillColor = self.sunColor.CGColor;
    

    self.animation.keyPath = @"transform.rotation.z";
    self.animation.fromValue = @(0);
    self.animation.toValue = @(M_PI*2);
    self.animation.duration = self.duration;
    self.animation.autoreverses = NO;
    self.animation.repeatCount = MAXFLOAT;

    //设置锚点位置
    self.lineLayer.anchorPoint = CGPointMake(center.x/width,center.y/height);
    self.lineLayer.position =center;
    self.lineLayer.bounds = CGRectMake(0, 0,width,height);
    
    [self.lineLayer addAnimation:self.animation forKey:@""];
}


@end
