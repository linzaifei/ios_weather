//
//  HourView.m
//  weather
//
//  Created by zifei on 2021/3/3.
//

#import "HourView.h"
#import "CodeToString.h"
#import "DateUtil.h"
#import "ThemeTools.h"
@interface HourView()
@property(nonatomic,strong)NSMutableArray<HourItemView*> *dayArrs;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *tipView;

//切换视图
@property(nonatomic,strong)HourDetailView *detailView;
@property(nonatomic,strong)UIView *bgView;

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
    self.dayArrs = [NSMutableArray array];
    
    self.detailView = [HourDetailView new];
    self.detailView.tag = 100;
    self.detailView.backgroundColor =  [UIColor  colorWithHexLightColor:COLOR_WHITE darkColor:COLOR_WHITE];
    [self.detailView addRadius:10];
    [self addSubview:self.detailView];

    self.bgView = [UIView new];
    self.bgView.tag = 101;
    self.bgView.backgroundColor = [UIColor  colorWithHexLightColor:COLOR_WHITE darkColor:COLOR_WHITE];
    [self.bgView addRadius:10];
    [self addSubview:self.bgView];
    
    
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"未来24小时天气";
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GREY darkColor:COLOR_GREY];
    [self.bgView addSubview:titleLabel];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.bgView addSubview:self.scrollView];
    
    self.tipView = [[UIView  alloc] init];
    self.tipView.backgroundColor = [UIColor colorWithHexLightColor:COLOR_BG darkColor:COLOR_BG];
    [self.tipView addRadius:5];
    [self.bgView addSubview:self.tipView];
  
  
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
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
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
    [self.detailView addTarget:^(UIGestureRecognizer *x){
        @strongify(self);
        [UIView feedback];
        [self changeView:nil];
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
        itemView.tempIconLabel.textColor = [ThemeTools getColorWithName:obj.text];
        itemView.tempLabel.text =[NSString stringWithFormat:@"%@°",obj.temp];
        [itemView addTarget:^(UIGestureRecognizer *x){
            @strongify(self);
            [UIView feedback];
            [self changeView:obj];
        }];
    }];
}

-(void)changeView:(id)obj{
    @weakify(self);
    UIViewAnimationOptions animationOptions = [[self viewWithTag:100] isEqual:self.detailView]?UIViewAnimationOptionTransitionFlipFromBottom:UIViewAnimationOptionTransitionFlipFromTop;
    if(obj){
        self.detailView.hourly = obj;
        [self.detailView reload];
    }
    [UIView  transitionFromView:[self viewWithTag:101] toView:[self viewWithTag:100] duration:1 options:animationOptions |UIViewAnimationOptionShowHideTransitionViews completion:^(BOOL finished) {
        @strongify(self);
        if ([[self viewWithTag:100] isEqual:self.detailView]) {
            self.detailView.tag = 101;
            self.bgView.tag = 100;
        } else {
            self.detailView.tag    = 100;
            self.bgView.tag = 101;
        }
    }];
}

@end

@implementation HourItemView


- (instancetype)init{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}


-(void)setUI{
//    self.backgroundColor = [UIColor whiteColor];
    
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
    _tempWordLabel.font = [UIFont systemFontOfSize:15];
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

@interface HourDetailView()
/* hour */
@property(nonatomic,strong)UILabel *hourLabel;

/*天气icon */
@property(nonatomic,strong)UILabel *tempIconLabel;

/*文件*/
@property(nonatomic,strong)UILabel *textLabel;

@property(nonatomic,strong) NSMutableArray *items;
@end
@implementation HourDetailView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self  setHourDetail];
    }
    return self;
}

-(void)setHourDetail{
    
    _hourLabel = [[UILabel alloc] init];
    _hourLabel.font = [UIFont systemFontOfSize:15];
    _hourLabel.text = ic_100;
    _hourLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
    [self addSubview:_hourLabel];
    
    
    _tempIconLabel = [[UILabel alloc] init];
    _tempIconLabel.font = [UIFont iconfont:35];
    _tempIconLabel.text = ic_100;
    _tempIconLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
    [self addSubview:_tempIconLabel];
    
    _textLabel = [[UILabel alloc] init];
    _textLabel.font = [UIFont boldSystemFontOfSize:15];
    _textLabel.text = ic_100;
    _textLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_textLabel];
    
   self.items = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        IconView *iconView = [IconView new];
        [self addSubview:iconView];
        [self.items addObject:iconView];
    }
    [self.items mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-5);
    }];
    [self.items mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:0 tailSpacing:0];
    
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
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.tempIconLabel.mas_bottom).offset(10);
    }];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.hourly) {
        _hourLabel.text = [NSString stringWithFormat:@"%@:00",[DateUtil getDateStrInfo:self.hourly.fxTime][@"h"]];
        _tempIconLabel.text = [CodeToString getWith:[self.hourly.icon intValue]];
        _tempIconLabel.textColor = [ThemeTools getColorWithName:self.hourly.text];
        _textLabel.text = [NSString stringWithFormat:@"%@° / %@",self.hourly.temp,self.hourly.text];
       
        NSArray *arr = @[@{@"i":ic_wind,@"t":self.hourly.windDir,@"v":[NSString stringWithFormat:@"%@级",self.hourly.windScale]},
        @{@"i":ic_temp,@"t":@"湿度",@"v":[NSString stringWithFormat:@"%@%%",self.hourly.humidity]},
        @{@"i":ic_rain,@"t":@"降水量",@"v":[NSString stringWithFormat:@"%@mm",self.hourly.precip]},
        @{@"i":ic_cloud,@"t":@"云",@"v":[NSString stringWithFormat:@"%@%%",self.hourly.cloud]},];
        
        @weakify(self);
        [arr enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            @strongify(self);
            IconView *iconView = self.items[idx];
            iconView.iconLabel.text = obj[@"i"];
            iconView.iconLabel.textColor = [ThemeTools getColorWithName:self.hourly.text];
            iconView.textLabel.text = obj[@"t"];
            iconView.valueLabel.text = obj[@"v"];
        }];
        
    }
    
}

@end


@implementation IconView


- (instancetype)init{
    self = [super init];
    if (self) {
        [self  setIconView];
    }
    return self;
}

-(void)setIconView{
    
    _iconLabel = [[UILabel alloc] init];
    _iconLabel.font = [UIFont iconfont:25];
    _iconLabel.text = ic_100;
    _iconLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_iconLabel];
    
    _textLabel = [[UILabel alloc] init];
    _textLabel.font = [UIFont systemFontOfSize:14];
    _textLabel.text = @"东南风";
    _textLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GREY darkColor:COLOR_GREY];
    [self addSubview:_textLabel];
    
    _valueLabel = [[UILabel alloc] init];
    _valueLabel.font = [UIFont systemFontOfSize:15];
    _valueLabel.text = @"3-4级";
    _valueLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
    [self addSubview:_valueLabel];
    @weakify(self);
    [_iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(@5);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.iconLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.textLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(@-5);
    }];
}

@end
