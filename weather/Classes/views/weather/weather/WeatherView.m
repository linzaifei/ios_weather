//
//  WeatherView.m
//  weather
//
//  Created by zifei on 2021/3/2.
//

#import "WeatherView.h"


@implementation WeatherView
- (instancetype)init{
    self = [super init];
    if (self) {
        [self setWeatherView];
    }
    return self;
}

-(void)setWeatherView{

    [self addRadius:10];
    
    _defaultView = [[UIView alloc] init];
    [self addSubview:self.defaultView];
    
    _tempNowView = [[TempNowView alloc] init];
    _tempNowView.backgroundColor = [UIColor whiteColor];
    [self addSubview: _tempNowView];
    
    @weakify(self);
    [_defaultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        make.height.equalTo(@220);
    }];
    [_tempNowView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.defaultView.mas_bottom);
        make.left.right.equalTo(@0);
        make.height.equalTo(@80);
        make.bottom.equalTo(@0);
    }];
    
}

@end


@implementation TempNowView
- (instancetype)init{
    self = [super init];
    if (self) {
        [self settempNow];
    }
    return self;
}

-(void)settempNow{

    _tempLabel = [[UILabel alloc] init];
    _tempLabel.font = [UIFont systemFontOfSize:50.f weight:UIFontWeightBold];
    _tempLabel.text = @"12°";
    _tempLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_tempLabel];
    
    _tempWordLabel = [[UILabel alloc] init];
    _tempWordLabel.font = [UIFont boldSystemFontOfSize:15];
    _tempWordLabel.text = @"晴";
//    _tempWordLabel.backgroundColor = [UIColor orangeColor];
    _tempWordLabel.textAlignment = NSTextAlignmentCenter;
//    [_tempWordLabel addRadius:5];
    _tempWordLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_tempWordLabel];
    
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont boldSystemFontOfSize:15];
    _timeLabel.text = @"03 / 02 周二";
    _timeLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_timeLabel];
    
    _windLabel = [[UILabel alloc] init];
    _windLabel.font = [UIFont systemFontOfSize:15];
    _windLabel.text = @"东北风 / 3级";
    _windLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
    [self addSubview:_windLabel];
    
    
    @weakify(self);
    [_tempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(@10);
    }];
    
    [_tempWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerY.equalTo(self.mas_centerY).offset(-15);
        make.left.equalTo(self.tempLabel.mas_right).offset(10);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerY.equalTo(self.tempWordLabel.mas_centerY);
        make.left.equalTo(self.tempWordLabel.mas_right).offset(10);
    }];
    
    [_windLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerY.equalTo(self.mas_centerY).offset(15);
        make.left.equalTo(self.tempLabel.mas_right).offset(10);
        
    }];
}

@end


@implementation SunWeatherView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self sun];
    }
    return self;
}

-(void)sun{
    _sunView = [[SunView alloc] init];
    
    [self.defaultView addSubview:_sunView];
    
    [_sunView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
        
    }];
}

@end
