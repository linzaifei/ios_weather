//
//  HourView.m
//  weather
//
//  Created by zifei on 2021/3/3.
//

#import "HourView.h"
#import "CodeToString.h"
#import <QWeather/WeatherBaseClass.h>
#import "DateUtil.h"
@interface HourView()
@property(nonatomic,strong)NSMutableArray<HourItemView*> *dayArrs;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *tipView;
@end
@implementation HourView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}


-(void)setUI{
    UIView *bg = [UIView new];
    [self addSubview:bg];
    self.dayArrs = [NSMutableArray array];
    bg.backgroundColor = [UIColor  colorWithHexLightColor:COLOR_WHITE darkColor:COLOR_WHITE];
    [bg addRadius:10];

    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"未来24小时天气";
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GREY darkColor:COLOR_GREY];
    [bg addSubview:titleLabel];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [bg addSubview:self.scrollView];
    
    self.tipView = [[UIView  alloc] init];
    self.tipView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_BG darkColor:COLOR_BG];
    [self.tipView addRadius:5];
    [bg addSubview:self.tipView];

    for (int i=0; i<24; i++) {
        HourItemView *hourItemView = [[HourItemView alloc] init ];
        [self.scrollView addSubview:hourItemView];
        [self.dayArrs addObject:hourItemView];
    }
    
    [self.dayArrs mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:0 tailSpacing:0];
    [self.dayArrs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(@0);
        make.width.equalTo(@60);
    }];
    
    @weakify(self);
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@10);
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
        make.left.right.equalTo(@0);
        make.height.equalTo(self.dayArrs.lastObject.mas_height);
    
    }];

    [self.tipView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.scrollView.mas_bottom).offset(5);
        make.height.greaterThanOrEqualTo(@40);
        make.bottom.equalTo(@-10);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
    }];
        
}
- (void)layoutSubviews{
    [super layoutSubviews];
    @weakify(self);
    [self.dataArr enumerateObjectsUsingBlock:^(Hourly*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @strongify(self);
        HourItemView *itemView = self.dayArrs[idx];
        itemView.hourLabel.text= [NSString stringWithFormat:@"%@:00",[DateUtil getDateStrInfo:obj.fxTime][@"h"]];  
        itemView.tempWordLabel.text =obj.text ;
        itemView.tempIconLabel.text = [CodeToString getWith:[obj.icon intValue]];
        itemView.tempLabel.text =[NSString stringWithFormat:@"%@°",obj.temp];
    }];
    
    
}

@end

@implementation HourItemView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}


-(void)setUI{
    self.backgroundColor = [UIColor whiteColor];
    
    _hourLabel = [[UILabel alloc] init];
    _hourLabel.font = [UIFont systemFontOfSize:15];
    _hourLabel.text = @"14:00";
    _hourLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GREY darkColor:COLOR_GREY];
    [self addSubview:_hourLabel];
    
    _tempIconLabel = [[UILabel alloc] init];
    _tempIconLabel.font = [UIFont iconfont:25];
    _tempIconLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
    [self addSubview:_tempIconLabel];
    
    _tempWordLabel = [[UILabel alloc] init];
    _tempWordLabel.font = [UIFont boldSystemFontOfSize:15];
    _tempWordLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_tempWordLabel];
    
    _tempLabel = [[UILabel alloc] init];
    _tempLabel.font = [UIFont systemFontOfSize:15];
    _tempLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_tempLabel];
    
  
    @weakify(self);
    [_hourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
       make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(@5);
    }];
    

    [_tempIconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
       make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.hourLabel.mas_bottom).offset(10);
    }];
    
    [_tempWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
       make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.tempIconLabel.mas_bottom).offset(10);
    }];
    
    [_tempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.tempWordLabel.mas_bottom).offset(10);
        make.bottom.equalTo(@-10);
    }];
   
   
}

@end
