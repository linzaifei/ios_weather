//
//  RainView.m
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "RainView.h"

#import "UIImage+category.h"
@interface RainView()
@property(nonatomic,strong)CAEmitterLayer *emitterLayer;
@end
@implementation RainView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    self.layer.masksToBounds = YES;
    self.colors = @[[UIColor clearColor],[UIColor orangeColor]];
    
    self.emitterLayer = [CAEmitterLayer layer];
//    self.emitterLayer.birthRate = 5.f;

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
    cell.birthRate = self.rainType==RainTypeNormal?20.f:self.rainType==RainTypeMedium?40.f: 60.0f;
    //粒子生命周期 2s
    cell.lifetime = 40.0f;
    //发射速度
    cell.velocity = 20.0f;
    cell.velocityRange = 100.0f;
    
    //x y z 轴 加速度
    cell.yAcceleration = 90.0f;

    //缩放比例
    cell.scale = 1;
    cell.contents = (id)[UIImage imageWithColors:self.colors size:CGSizeMake(1, 40) direction:DirectionDown].CGImage;
    self.emitterLayer.emitterCells = @[cell];

    
}

@end
