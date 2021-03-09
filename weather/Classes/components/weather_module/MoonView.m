//
//  MoonView.m
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "MoonView.h"
@interface MoonView()
@property(nonatomic ,strong)CAShapeLayer *moonLayer ;
@property(nonatomic ,strong)CABasicAnimation *animation;

@property(nonatomic ,strong)NSMutableArray *stars;

@end
@implementation MoonView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self setUI];
    }
    return self;
}

-(void)setUI{
    //设置默认属性
    self.radius = 50;
    self.space = 30;
    self.starColor = [UIColor orangeColor];
    self.color = [UIColor orangeColor];
    self.stars = [NSMutableArray array];
    _count = 8;
    self.starColor = [UIColor orangeColor];
    self.layer.masksToBounds = YES;
    
    
    self.moonLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.moonLayer];
    
    self.animation = [CABasicAnimation animation];

    
    for (int i = 0; i<self.count; i++) {
        CAShapeLayer *starLayer = [CAShapeLayer layer];
        starLayer.lineCap = kCALineCapRound;
        [self.stars addObject:starLayer];
        [self.layer addSublayer:starLayer];
        
       
    }

}
-(int)getRandomNumber:(int)from to:(int)to{
  return  rand() % (to - from + 1) + from;
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    CGFloat x0 = rect.size.width-self.radius-self.space;
    CGFloat y0 = self.radius+self.space;

     UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(x0, y0) radius:self.radius startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:NO];
    [path addQuadCurveToPoint:CGPointMake(x0, self.space) controlPoint:CGPointMake(x0-self.space-10, y0)];
    self.moonLayer.fillColor = self.color.CGColor;
    self.moonLayer.path = path.CGPath;
    
    for (CAShapeLayer *starLayer in self.stars) {
        int radius =[self getRandomNumber:5 to:10];
        int x =[self getRandomNumber:30 to:rect.size.width-30];
        int y =[self getRandomNumber:10 to:rect.size.height-10];
//        CGFloat opacity = (rand() % 1 + 0.5);
//        starLayer.opacity = opacity;
        starLayer.path = [self starNewPath:CGPointMake(x, y) radius:radius].CGPath;
        starLayer.lineWidth = 4;
        starLayer.strokeColor = self.starColor.CGColor;
        
        self.animation.keyPath = @"opacity";
        self.animation.toValue = @(0.3);
        self.animation.duration = 3;
        self.animation.repeatCount= MAXFLOAT;
        self.animation.autoreverses = YES;
        
    
        [starLayer addAnimation:self.animation forKey:@""];
    }
    
   
    
}


-(UIBezierPath *)starNewPath:(CGPoint )center radius:(CGFloat)radius{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(center.x-radius/2.0, center.y)];
    [path addLineToPoint:CGPointMake(center.x+radius/2.0, center.y)];
    
    [path moveToPoint:CGPointMake(center.x, center.y-radius/2.0)];
    [path addLineToPoint:CGPointMake(center.x, center.y+radius/2.0)];
    return path;
}

/**

 */
-(UIBezierPath *)starPath:(CGPoint )center radius:(CGFloat)radius{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint a = CGPointMake(center.x, center.y-radius);
    CGPoint b = CGPointMake(center.x+ radius*cos(18/180.f*M_PI),center.y -radius*sin(18/180.f*M_PI));
    CGPoint c = CGPointMake(center.x+ radius*sin(54/180.f*M_PI),center.y +radius*sin(54/180.f*M_PI));
    CGPoint d = CGPointMake(center.x -radius*sin(36/180.f*M_PI),center.y+ radius*cos(36/180.f*M_PI));
    CGPoint e = CGPointMake(center.x-radius*cos(18/180.f*M_PI), center.y-radius*sin(18/180.f*M_PI));

    [path moveToPoint:a];
    [path addLineToPoint:c];
    [path addLineToPoint:e];
    [path addLineToPoint:b];
    [path addLineToPoint:d];
    [path closePath];
    
    return  path;
}


@end
