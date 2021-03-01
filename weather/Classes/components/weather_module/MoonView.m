//
//  MoonView.m
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "MoonView.h"
@interface MoonView()
@property(nonatomic ,strong)CAShapeLayer *sunLayer ;
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
    self.layer.masksToBounds = YES;
    
    
    self.sunLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.sunLayer];
    
    
    self.animation = [CABasicAnimation animation];
    
    

    
    
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
