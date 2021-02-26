//
//  SnowView.m
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "SnowView.h"

@interface SnowView()
@property(nonatomic,strong)CAEmitterLayer *emitterLayer;
@end
@implementation SnowView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    self.layer.masksToBounds = YES;
    self.color= [UIColor orangeColor];
    
    self.emitterLayer = [CAEmitterLayer layer];
    self.emitterLayer.emitterShape =kCAEmitterLayerLine;
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
    self.emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    [self.layer addSublayer:self.emitterLayer];

    
}

- (void)drawRect:(CGRect)rect{
    self.emitterLayer.emitterPosition = CGPointMake(rect.size.width/2, -10);
    self.emitterLayer.emitterSize = CGSizeMake(rect.size.width,rect.size.height);
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    
    cell.name = @"rain";
    //粒子的产生率
    cell.birthRate =self.snowType==SnowTypeNormal?20.f:self.snowType==SnowTypeMedium?40.f: 60.0f;
    //粒子生命周期 2s
    cell.lifetime = 40.0f;
    //发射速度
    cell.velocity = 20.0f;
    cell.velocityRange = 100.0f;
    
    // 加速度
    cell.yAcceleration = 90.0f;

    // 缩放比列
    cell.scale = 0.3;
    cell.scaleRange = 0.5;
    cell.scaleSpeed = 0.02;
    
    cell.spin = 0.f;
    cell.spinRange = M_PI;
    
    cell.color = self.color.CGColor;
    cell.contents = (id)[UIImage imageNamed:@"snow"].CGImage;
    self.emitterLayer.emitterCells = @[cell];

    
}

@end
