//
//  FogView.m
//  weather
//
//  Created by zifei on 2021/3/9.
//

#import "FogView.h"

@implementation FogView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self fog];
    }
    return self;
}

-(void)fog{
  

    for (int i = 0; i<20; i++) {
        int radius =[self getRandomNumber:10 to:20];
        int x =[self getRandomNumber:20 to:[UIScreen mainScreen].bounds.size.width-80];
        int y =[self getRandomNumber:30 to:200];

        CAReplicatorLayer *reLayer = [self getFogView:CGRectMake(x, y, radius, radius)];
        [self.layer addSublayer:reLayer];
        
    }
}

-(int)getRandomNumber:(int)from to:(int)to{
  return  rand() % (to - from + 1) + from;
}

-(CAReplicatorLayer *)getFogView:(CGRect)rect{
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds = CGRectMake(0, 0, w/2, w/2);
    UIBezierPath *p = [UIBezierPath bezierPathWithRect:shapeLayer.bounds];
    shapeLayer.path = p.CGPath;
    shapeLayer.anchorPoint = CGPointMake(0.5, 0.5);
    shapeLayer.position =CGPointMake(w/2,h/2);
    shapeLayer.cornerRadius = w/4;
    shapeLayer.masksToBounds = YES;
    shapeLayer.fillColor = [[UIColor  colorWithHexLightColor:COLOR_FOG darkColor:COLOR_FOG] CGColor];
    
    CAReplicatorLayer *reLayer = [CAReplicatorLayer layer];
    reLayer.frame = rect;
    reLayer.instanceCount = 3;
    reLayer.instanceDelay = 0.3;
    [reLayer addSublayer:shapeLayer];
  

    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 1;
    group.repeatCount = MAXFLOAT;

    CABasicAnimation *ani = [CABasicAnimation animation];
    ani.keyPath =@"opacity";
    ani.toValue=@0;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.toValue = @(3);
    group.animations = @[ani,animation];
    
    [shapeLayer addAnimation:group forKey:@""];
    
    return reLayer;
}

@end
