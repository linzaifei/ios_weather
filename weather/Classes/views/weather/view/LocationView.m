//
//  LoationView.m
//  weather
//
//  Created by zifei on 2021/3/9.
//

#import "LocationView.h"
#import "iconfont.h"
@implementation LocationView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
   
    UILabel *searchLabel = [UILabel new];
    searchLabel.text =ic_search;
    searchLabel.font = [UIFont iconfont:20];
    [self addSubview:searchLabel];
    

     _cityLabel = [UILabel new];
    _cityLabel.font = [UIFont boldSystemFontOfSize:13];
    _cityLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
     [self addSubview:_cityLabel];

 


     _areaLabel = [UILabel new];
    _areaLabel.font = [UIFont systemFontOfSize:12];
    _areaLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
     [self addSubview:_areaLabel];

    @weakify(self);
    [searchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(@0);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [_cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(searchLabel.mas_right).offset(5);
        make.bottom.equalTo(self.mas_centerY).offset(0);
    }];
    [_areaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self.cityLabel.mas_left);
        make.top.equalTo(self.mas_centerY).offset(0);
    }];

    _cityLabel.text = @"南京市";
    _areaLabel.text = @"牛首山风景区牛首山风景区";
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
