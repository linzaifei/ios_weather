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
    self.layer.masksToBounds = YES;
    
    
    self.moonLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.moonLayer];
    
    self.animation = [CABasicAnimation animation];


    

    
    for (int i = 0; i<8; i++) {
        int radius =[self getRandomNumber:8 to:10];
        int x =[self getRandomNumber:30 to:200];
        int y =[self getRandomNumber:10 to:240];
        CAShapeLayer *starLayer = [CAShapeLayer layer];
        starLayer.path = [self starPath:CGPointMake(x, y) radius:radius].CGPath;
        starLayer.fillColor = self.starColor.CGColor;;
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
    [path addArcWithCenter:CGPointMake(x0, y0) radius:self.radius startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    [path addQuadCurveToPoint:CGPointMake(x0, self.space) controlPoint:CGPointMake(x0+self.space, y0)];
    self.moonLayer.fillColor = self.color.CGColor;
    self.moonLayer.path = path.CGPath;
    
    
    
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
