//
//  WeatherView.m
//  weather
//
//  Created by zifei on 2021/3/2.
//

#import "WeatherView.h"
#import "DateUtil.h"
#import "SunView.h"
#import "MoonView.h"
#import "RainView.h"
#import "SnowView.h"
#import "CloudView.h"
#import "FogView.h"
@interface WeatherView()
@property(nonatomic,strong)SunView *sunView;
@property(nonatomic,strong)MoonView *moonView;
@property(nonatomic,strong)CloudView *cloudView;
@property(nonatomic,strong)SnowView *snowView;
@property(nonatomic,strong)RainView *rainView;
@property(nonatomic,strong)FogView *fogView;

@end
@implementation WeatherView
- (instancetype)init{
    self = [super init];
    if (self) {
        [self setWeatherView];
    }
    return self;
}

-(void)setWeatherView{
    UIView *bg = [UIView new];
    [self addSubview:bg];
    [bg addRadius:10];
    
    _defaultView = [[UIView alloc] init];
    [bg addSubview:self.defaultView];
    
    _tempNowView = [[TempNowView alloc] init];
    _tempNowView.backgroundColor = [UIColor whiteColor];
    [bg addSubview: _tempNowView];
    
    @weakify(self);
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
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

-(void)layoutSubviews{
    [super layoutSubviews];
    if(self.now){
        _tempNowView.tempLabel.text = [NSString stringWithFormat:@"%@°",self.now.temp];
        _tempNowView.tempWordLabel.text = self.now.text;
        _tempNowView.timeLabel.text = [NSString stringWithFormat:@"%@ / %@ 周%@",[DateUtil getDateStrInfo:self.now.obsTime][@"m"],[DateUtil getDateStrInfo:self.now.obsTime][@"d"],[DateUtil getDateStrInfo:self.now.obsTime][@"w"]];
        _tempNowView.windLabel.text = [NSString stringWithFormat:@"%@ / %@级",self.now.windDir,self.now.windScale];
//        
//        if (self.defaultView.subviews.count>0) {
//            BaseView *baseView = [self.defaultView.subviews lastObject];
//            [baseView mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.edges.equalTo(@0);
//            }];
////            [baseView removeFromSuperview];e
//            
//        }
        BaseView *baseView1 = [self getWeatherViewText:self.now.text];
        [ baseView1 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }
}

-(BaseView *)getWeatherViewText:(NSString*)text{
    
    BaseView *baseView = nil;
    if([text containsString:@"晴"]){
        if(self.daily){
            NSTimeInterval time1 = [self getCurrentTime];
            NSTimeInterval time=  [self getRunSetTime:[NSString stringWithFormat:@"%@ %@",self.daily.fxDate,self.daily.sunset]];
            if(time1>time){
                return self.cloudView;
            }
        }
      
        
        return self.sunView;
    }else if([text containsString:@"雨"]){
        return self.rainView;
    }else if([text containsString:@"云"]||[text containsString:@"阴"]){
        return self.cloudView;
    }else if([text containsString:@"霾"] ||[text containsString:@"雾"]){
        return self.fogView;
    }else if([text containsString:@"雪"]){
        return self.snowView;
    }
    return  baseView;
}

//获取当时时间戳
-(NSTimeInterval)getCurrentTime{
    NSDate* dat = [NSDate date];
    NSTimeInterval time=[dat timeIntervalSince1970];
    return time;
}

//获取日落时间戳
-(NSTimeInterval)getRunSetTime:(NSString *)timeStr{
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    NSDate *date = [dataFormatter dateFromString:timeStr];
    
    NSTimeInterval time =  [date timeIntervalSince1970];
    return time;
}


#pragma mark - 懒加载
-(SunView*)sunView{
    if(_sunView ==nil){
        _sunView = [[SunView alloc] init];
        _sunView.sunColor = [UIColor colorWithHexLightColor:COLOR_SUN darkColor:COLOR_SUN];
        _sunView.lineColor = [UIColor colorWithHexLightColor:COLOR_SUN darkColor:COLOR_SUN];
        _sunView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_SUN_BG darkColor:COLOR_SUN_BG];
        [self.defaultView addSubview:_sunView];
    }
    return _sunView;
}

-(MoonView*)moonView{
    if(_moonView ==nil){
        _moonView = [[MoonView alloc] init];
        _moonView.color = [UIColor colorWithHexLightColor:COLOR_MOON darkColor:COLOR_MOON];
        _moonView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_MOON_BG darkColor:COLOR_MOON_BG];
        _moonView.starColor = [UIColor colorWithHexLightColor:COLOR_STAR darkColor:COLOR_STAR];
        [self.defaultView addSubview:_moonView];
    }
    return _moonView;
}
-(CloudView*)cloudView{
    if(_cloudView ==nil){
        _cloudView = [[CloudView alloc] init];
        _cloudView.color = [UIColor colorWithHexLightColor:COLOR_CLOUD darkColor:COLOR_CLOUD];
        _cloudView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_CLOUD_BG darkColor:COLOR_CLOUD_BG];
        [self.defaultView addSubview:_cloudView];
    }
    return _cloudView;
}
- (SnowView *)snowView{
    if (_snowView ==nil) {
        _snowView = [[SnowView alloc] init];
        _snowView.color = [UIColor colorWithHexLightColor:COLOR_WHITE darkColor:COLOR_WHITE];
        _snowView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_MOON_BG darkColor:COLOR_MOON_BG];

        [self.defaultView addSubview:_snowView];
    }
    return _snowView;
}
- (RainView *)rainView{
    if (_rainView == nil) {
        _rainView = [[RainView alloc] init];
        _rainView.colors = @[[UIColor clearColor],[UIColor colorWithHexLightColor:COLOR_RAIN darkColor:COLOR_RAIN]];
        _rainView.color = [UIColor colorWithHexLightColor:COLOR_RAIN darkColor:COLOR_RAIN];
        _rainView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_RAIN_BG darkColor:COLOR_RAIN_BG];
        [self.defaultView addSubview:_rainView];
        
    }
    return _rainView;
}

- (FogView *)fogView{
    if(_fogView==nil){
        _fogView = [[FogView alloc] init];
        _fogView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_LINE darkColor:COLOR_LINE];
        [self.defaultView addSubview:_fogView];
    }
    return _fogView;
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
    _tempWordLabel.textAlignment = NSTextAlignmentCenter;
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

/*
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
    _sunView.sunColor = [UIColor colorWithHexLightColor:COLOR_SUN darkColor:COLOR_SUN];
    _sunView.lineColor = [UIColor colorWithHexLightColor:COLOR_SUN darkColor:COLOR_SUN];
    _sunView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_SUN_BG darkColor:COLOR_SUN_BG];
    [self.defaultView addSubview:_sunView];
    
    [_sunView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
  
}

@end

@implementation MoonWeatherView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self sun];
    }
    return self;
}

-(void)sun{
    _moonView = [[MoonView alloc] init];
    _moonView.color = [UIColor colorWithHexLightColor:COLOR_MOON darkColor:COLOR_MOON];
    _moonView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_MOON_BG darkColor:COLOR_MOON_BG];
    _moonView.starColor = [UIColor colorWithHexLightColor:COLOR_STAR darkColor:COLOR_STAR];
    [self.defaultView addSubview:_moonView];
    
    [_moonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
  
}


@end


@implementation CloudWeatherView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self cloud];
    }
    return self;
}

-(void)cloud{
    _cloudView = [[CloudView alloc] init];
    _cloudView.color = [UIColor colorWithHexLightColor:COLOR_CLOUD darkColor:COLOR_CLOUD];
    _cloudView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_CLOUD_BG darkColor:COLOR_CLOUD_BG];

    [self.defaultView addSubview:_cloudView];
    
    [_cloudView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
  
}


@end


@implementation SnowWeatherView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self snow];
    }
    return self;
}

-(void)snow{
    _snowView = [[SnowView alloc] init];
    _snowView.color = [UIColor colorWithHexLightColor:COLOR_WHITE darkColor:COLOR_WHITE];
    _snowView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_MOON_BG darkColor:COLOR_MOON_BG];

    [self.defaultView addSubview:_snowView];
    
    [_snowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
}

@end

@implementation RainWeatherView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self rain];
    }
    return self;
}

-(void)rain{
    _rainView = [[RainView alloc] init];
    _rainView.colors = @[[UIColor clearColor],[UIColor colorWithHexLightColor:COLOR_RAIN darkColor:COLOR_RAIN]];
    _rainView.color = [UIColor colorWithHexLightColor:COLOR_RAIN darkColor:COLOR_RAIN];
    _rainView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_RAIN_BG darkColor:COLOR_RAIN_BG];
    [self.defaultView addSubview:_rainView];
    
    [_rainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
  
}


@end
 **/
