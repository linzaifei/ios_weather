//
//  RainChartView.m
//  weather
//
//  Created by zifei on 2021/3/10.
//

#import "RainChartView.h"
#import "ChartUtils.h"

@implementation RainWeatherCharts

- (instancetype)init{
    self = [super init];
    if (self) {
        [self  setUI];
    }
    return self;
}

-(void)setUI{
    
    _rainChartView = [[RainChartView alloc] init];
    [self addSubview:_rainChartView];
    [_rainChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(@10);
        make.height.equalTo(@200);
    }];
    
    @weakify(self);
    [[RACObserve(self, modal) skip:1] subscribeNext:^(WeatherMinutelyBaseClass*  _Nullable x) {
        @strongify(self);
        if([x.summary isEqual:@"未来两小时无降水"]){
            [self.rainChartView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@0);
                make.top.equalTo(@0);
            }];
        }else{
            self.rainChartView.values = x.minutely;
        }
    }];
}

@end


@interface RainChartView()

@property(nonatomic,strong)CAShapeLayer *lineLayer;
@property(nonatomic,strong)CAGradientLayer *gradinentLayer;
@property(nonatomic,strong)CABasicAnimation *animation;

@end
@implementation RainChartView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self chart];
    }
    return self;
}

-(void)chart{
    [self addRadius:10];
    self.row = 6;
    self.col = 4;
    self.bottom_space = 40;
    self.space = 20;
    self.lineWidth = 1;
    self.backgroundColor = [UIColor colorWithHexLightColor:COLOR_WHITE darkColor:COLOR_WHITE];
    self.lineColor = [UIColor colorWithHexLightColor:COLOR_RAIN_LINE darkColor:COLOR_RAIN_LINE];
    self.lineDashColor = [UIColor colorWithHexLightColor:COLOR_LINE darkColor:COLOR_LINE];
    
    self.rowColor = [UIColor colorWithHexLightColor:COLOR_RAIN_TEXT darkColor:COLOR_RAIN_TEXT];
    self.colColor =[UIColor colorWithHexLightColor:COLOR_RAIN_LINE darkColor:COLOR_RAIN_LINE];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.frame =CGRectMake(0, 0, 400, 280);
    

    
//    self.lineLayer = [CAShapeLayer layer];
//    self.lineLayer.strokeEnd = 0;
//    [self.layer addSublayer:self.lineLayer];
    
    
    
    self.gradinentLayer = [CAGradientLayer layer];
    self.gradinentLayer.mask = [CAShapeLayer layer];
    [self.layer addSublayer:self.gradinentLayer];
    
    
    

    self.animation = [CABasicAnimation animation];
    self.animation .fillMode=kCAFillModeForwards;
    self.animation .removedOnCompletion = NO;
    self.animation.keyPath = @"locations";
//    self.animation.keyPath =@"strokeEnd";
//    self.animation.duration = 2;
//    self.animation.fromValue = @0;
//    self.animation.toValue = @1;
//    self.animation.autoreverses = NO;
    
  
    
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
    CGFloat max = height - self.bottom_space  -self.space; // 表示
    CGFloat row = (width - self.space*2)/self.values.count;//水平平均距离
    CGFloat col = max/1.5;
    
    NSArray *points = [RainChartView getValuePointsWithArr:self.values row:row col:col max:max];
    
    
    
    
    CGRect frme = CGRectMake(self.space, self.space, width-self.space*2, height-self.bottom_space-self.space);
    UIBezierPath *path = [ChartUtils pathWithPoints:points isCurve:YES maxY:max];
//    self.lineLayer.frame = frme;
//    self.lineLayer.fillColor = [UIColor clearColor].CGColor;
//    self.lineLayer.strokeColor = self.lineColor.CGColor;
//    self.lineLayer.path = path.CGPath;
    
    self.gradinentLayer.frame = frme;
    self.gradinentLayer.colors = @[(id)self.lineColor.CGColor,(id)[UIColor clearColor].CGColor];
    self.gradinentLayer.locations = @[@0,@0];
    self.gradinentLayer.startPoint = CGPointMake(0, 1);
    self.gradinentLayer.endPoint = CGPointMake(1, 1);
    self.gradinentLayer.type = kCAGradientLayerAxial;
    CAShapeLayer *shapeLayer = self.gradinentLayer.mask;
    shapeLayer.path = path.CGPath;
    

 
   
    self.animation.fromValue =@[@0,@0];
    self.animation.toValue =@[@1,@0];
    self.animation.duration = 2;
    [self.gradinentLayer addAnimation:self.animation forKey:@"line"];


   
}





@end


@implementation RainChartView(values)

+(NSArray *)getValuePointsWithArr:(NSArray*)arr row:(CGFloat)row col:(CGFloat)col max:(CGFloat)max{
    
    NSMutableArray *muArr =[NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(NSDictionary* _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat y = [obj[@"precip"] floatValue]*col;
        CGPoint p = CGPointMake(row * idx, max-y);
        [muArr addObject:[NSValue valueWithCGPoint:p]];
    }];
    return muArr;
}

@end
