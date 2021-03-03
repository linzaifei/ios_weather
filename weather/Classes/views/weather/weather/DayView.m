//
//  DayView.m
//  weather
//
//  Created by zifei on 2021/3/2.
//

#import "DayView.h"

@interface DayView()
@property(nonatomic,copy)NSMutableArray *items;
@end
@implementation DayView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}


-(void)setUI{
    DayItemView *dayItemView = [[DayItemView alloc] init ];
    
    [self addSubview:dayItemView];
    
    [dayItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(@0);
        make.width.equalTo(@60);
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation DayItemView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}


-(void)setUI{
    _weekLabel = [[UILabel alloc] init];
    _weekLabel.font = [UIFont boldSystemFontOfSize:15];
    _weekLabel.text = @"五";
    _weekLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_weekLabel];
    
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.font = [UIFont boldSystemFontOfSize:15];
    _dateLabel.text = @"02";
    _dateLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_dateLabel];
    
    _dayLabel = [[UILabel alloc] init];
    _dayLabel.font = [UIFont boldSystemFontOfSize:15];
    _dayLabel.text = @"晴";
    _dayLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_dayLabel];
    
    _dayIconLabel = [[UILabel alloc] init];
    _dayIconLabel.font = [UIFont boldSystemFontOfSize:15];
    _dayIconLabel.text = @"晴";
    _dayIconLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_dayIconLabel];
    
    _weatherProgressView = [[WeatherProgressView alloc] init];
    [self addSubview:_weatherProgressView];
    
    
    _nightLabel = [[UILabel alloc] init];
    _nightLabel.font = [UIFont boldSystemFontOfSize:15];
    _nightLabel.text = @"晴";
    _nightLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_nightLabel];
    
    _nightIconLabel = [[UILabel alloc] init];
    _nightIconLabel.font = [UIFont boldSystemFontOfSize:15];
    _nightIconLabel.text = @"晴";
    _nightIconLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_nightIconLabel];
    @weakify(self);
    [_weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
       make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(@5);
    }];
    

    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
       make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.weekLabel.mas_bottom).offset(10);
    }];
    
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
       make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.dateLabel.mas_bottom).offset(10);
    }];
    
    [_dayIconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
       make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.dayLabel.mas_bottom).offset(10);
    }];
    [_weatherProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
       make.centerX.equalTo(self.mas_centerX);
       make.top.equalTo(self.dayIconLabel.mas_bottom).offset(10);
        make.height.equalTo(@100);
        make.width.equalTo(@30);
    }];
    
    [_nightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
       make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.weatherProgressView.mas_bottom).offset(10);
    }];
    [_nightIconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
       make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.nightLabel.mas_bottom).offset(10);
        make.bottom.equalTo(@-10);
    }];
}
@end

@interface WeatherProgressView()
@property(nonatomic,strong)CAShapeLayer *lineLayer;
@property(nonatomic,strong)CAShapeLayer *tempLayer;
@end
@implementation WeatherProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    self.lineLayer = [CAShapeLayer layer];
    
    [self.layer addSublayer:self.lineLayer];

    self.tempLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.tempLayer];
    
}

- (void)drawRect:(CGRect)rect{
    CGFloat x = rect.size.width/2;
    CGFloat height = rect.size.height;
    
    CGPoint startPoint = CGPointMake(x, 0);
    
//    CATextLayer
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:startPoint];
    [linePath addLineToPoint:CGPointMake(x, 60)];
    
    [linePath moveToPoint:CGPointMake(x, 80)];
    [linePath addLineToPoint:CGPointMake(x, height)];
    
    self.lineLayer.path =linePath.CGPath;
    self.lineLayer.strokeColor = [UIColor redColor].CGColor;
    self.lineLayer.lineWidth = 1;
    self.lineLayer.lineDashPattern= @[@5,@5];
    
    
}

@end
