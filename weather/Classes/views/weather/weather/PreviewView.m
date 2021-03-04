//
//  PreviewView.m
//  weather
//
//  Created by zifei on 2021/3/2.
//

#import "PreviewView.h"
#import <QWeather/WeatherBaseClass.h>
#import "CodeToString.h"
@interface PreviewView()

@property(nonatomic,strong)NSMutableArray<PreviewItemView *>* items;
@end

@implementation PreviewView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    self.items = [NSMutableArray array];
    for (int i=0; i<2; i++) {
        PreviewItemView * p =[[PreviewItemView alloc] init];
        [self addSubview:p];
        [self.items addObject:p];
    }
    
    [self.items mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:0 tailSpacing:0];
    
    [self.items mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(@0);
    }];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    @weakify(self);
    [self.dataArr enumerateObjectsUsingBlock:^(Daily*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @strongify(self);
       PreviewItemView *itemView = self.items[idx];
        itemView.tempWordLabel.text= obj.textDay ;
        itemView.tempLabel.text = [NSString stringWithFormat:@"%@°~%@°",obj.tempMin,obj.tempMax] ;
        itemView.timeLabel.text = idx==0?@"今":@"明";
        itemView.levelLabel.text = [NSString stringWithFormat:@"均温%d°",((int) ([obj.tempMax intValue]-[obj.tempMin intValue])/2 + [obj.tempMin intValue])];
    }];
    
    
}

@end

@interface PreviewItemView ()

@end
@implementation PreviewItemView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self  setUI];
    }
    return self;
}

-(void)setUI{
    [self addRadius:10];
    self.backgroundColor = [UIColor whiteColor];
    
    _tempWordLabel = [[UILabel alloc] init];
    _tempWordLabel.font = [UIFont boldSystemFontOfSize:17];
    _tempWordLabel.text = @"晴";
    _tempWordLabel.textAlignment = NSTextAlignmentCenter;
    _tempWordLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_tempWordLabel];
    
    _tempLabel = [[UILabel alloc] init];
    _tempLabel.font = [UIFont systemFontOfSize:15];
    _tempLabel.text = @"9° ~ 13°";
    _tempLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
    [self addSubview:_tempLabel];
    
    _levelLabel = [[UILabel alloc] init];
    _levelLabel.font = [UIFont systemFontOfSize:15];
    _levelLabel.text = @"均温 11°";
    _levelLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
    [self addSubview:_levelLabel];
    
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont boldSystemFontOfSize:15];
    _timeLabel.text = @"今";
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.backgroundColor = [UIColor colorWithHexLightColor:COLOR_BG darkColor:COLOR_BG];
    _timeLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GREY darkColor:COLOR_GREY];
    [self addSubview:_timeLabel];
    
    [_timeLabel addRadius:5];
    
    @weakify(self);
    [_tempWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@10);
    }];
    
    [_tempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(@10);
        make.top.equalTo(self.tempWordLabel.mas_bottom).offset(15);
    }];
    [_levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(@10);
        make.top.equalTo(self.tempLabel.mas_bottom).offset(15);
        make.bottom.equalTo(@-10);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@24);
        make.top.equalTo(@10);
        make.right.equalTo(@-10);
    }];
}

@end
