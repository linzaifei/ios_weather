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
@property(nonatomic,strong)CALayer *celllayer;



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
    
    self.mainColor = [UIColor orangeColor];
    self.color = [UIColor grayColor];
    self.count = 4;
    self.space = 60;
    self.duration = 15;
    self.delayTime =2;
    
    
    self.relayer = [CAReplicatorLayer layer];

    self.celllayer = [self cell1Layer];
    self.relayer.masksToBounds = YES;
    
///    self.relayer.backgroundColor = [UIColor blackColor].CGColor;
///   self.relayer.instanceColor = [UIColor redColor].CGColor;
///  self.relayer.instanceGreenOffset = -0.03;
    
    [self.relayer addSublayer: self.celllayer];
    [self.layer addSublayer:self.relayer];
///    self.celllayer.transform = CATransform3DMakeScale(0.4, 0.7, 1);
    self.animation = [CABasicAnimation animation];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.relayer.frame = CGRectMake(0, 30, rect.size.width,rect.size.height);
    self.relayer.instanceCount =self.count;
    self.relayer.instanceTransform = CATransform3DMakeTranslation(0, self.space, 0);
    self.relayer.instanceDelay = self.delayTime;
    self.animation.keyPath = @"position.x";
    self.animation.duration = self.duration;
    self.animation.fromValue = @(-self.celllayer.frame.size.width);
    self.animation.toValue = @(rect.size.width);
    
    self.animation.autoreverses = YES;
    self.animation.repeatCount = MAXFLOAT;
    [ self.celllayer addAnimation:self.animation forKey:@""];
}



-(CALayer *)cell1Layer{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(-80, 0, 80, 40);
    
    CAShapeLayer *la1 = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 80, 30) cornerRadius:15];
    la1.path = path.CGPath;
    la1.fillColor = [UIColor orangeColor].CGColor;
    
    CAShapeLayer *la2 = [CAShapeLayer layer];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 20, 45, 20) cornerRadius:10];
    la2.path = path1.CGPath;
    la2.fillColor = [UIColor grayColor].CGColor;
    
    [layer addSublayer:la1];
    [layer addSublayer:la2];
    
    
    return  layer;
    
}


@end
