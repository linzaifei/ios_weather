//
//  CloudView.m
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "CloudView.h"
@interface CloudView()
@property(nonatomic,strong)CAReplicatorLayer *relayer;
@property(nonatomic,strong)CABasicAnimation *animation;
@property(nonatomic,strong)CAShapeLayer *celllayer;

@end
@implementation CloudView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    
    self.relayer = [CAReplicatorLayer layer];
    self.relayer.frame = CGRectMake(0, 30, 400,260);
   
    self.celllayer = [CAShapeLayer layer];
    self.celllayer.fillColor = [UIColor orangeColor].CGColor;
    self.celllayer.path = [self path].CGPath;
    
    self.relayer.instanceCount =4;
    self.relayer.instanceTransform = CATransform3DMakeTranslation(0, 70, 0);
    self.relayer.instanceDelay = 2;
    self.relayer.masksToBounds = YES;
    
///    self.relayer.backgroundColor = [UIColor blackColor].CGColor;
///   self.relayer.instanceColor = [UIColor redColor].CGColor;
///  self.relayer.instanceGreenOffset = -0.03;
    
    [self.relayer addSublayer: self.celllayer];
    [self.layer addSublayer:self.relayer];
    
//    self.celllayer.transform = CATransform3DMakeScale(0.4, 0.7, 1);
    
    self.animation = [CABasicAnimation animation];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.animation.keyPath = @"position.x";
    self.animation.duration = 15;
    self.animation.fromValue = @0;
    self.animation.toValue = @(rect.size.width);
    
    self.animation.autoreverses = YES;
    self.animation.repeatCount = MAXFLOAT;
    [ self.celllayer addAnimation:self.animation forKey:@""];
}


-(UIBezierPath *)path{
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 80, 30) cornerRadius:20];

//    [path addArcWithCenter:CGPointMake(0, 30) radius:15 startAngle:M_PI_2 endAngle: -M_PI_2 clockwise:YES];
//    [path addLineToPoint:CGPointMake(50, 15)];
//    [path addArcWithCenter:CGPointMake(50, 30) radius:15 startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
//    [path addLineToPoint:CGPointMake(0, 45)];
  
    return path;
}


@end
