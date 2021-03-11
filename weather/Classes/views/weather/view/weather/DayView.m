//
//  DayView.m
//  weather
//
//  Created by zifei on 2021/3/2.
//

#import "DayView.h"
#import <QWeather/WeatherBaseClass.h>
#import "CodeToString.h"
#import "DateUtil.h"
#import "ThemeTools.h"
@interface DayView()
@property(nonatomic,strong)NSMutableArray<DayItemView*> *dayArrs;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *tipView;
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
    
    self.dayArrs = [NSMutableArray array];
    
    UIView *bg = [UIView new];
    [self addSubview:bg];
    bg.backgroundColor = [UIColor  colorWithHexLightColor:COLOR_WHITE darkColor:COLOR_WHITE];
    [bg addRadius:10];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"未来15天天气";
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

    for (int i=0; i<15; i++) {
        DayItemView *dayItemView = [[DayItemView alloc] init ];
        [self.scrollView addSubview:dayItemView];
        [self.dayArrs addObject:dayItemView];
    }
    
    [self.dayArrs mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:0 tailSpacing:0];
    [self.dayArrs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(@0);
        make.width.equalTo(@50);
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

    [[RACObserve(self, dataArr) skip:1] subscribeNext:^(id  _Nullable x) {
        [self.dataArr enumerateObjectsUsingBlock:^(Daily*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            @strongify(self);
            DayItemView *itemView = self.dayArrs[idx];
            itemView.weekLabel.text = [DateUtil getYYYYMMDDInfo:obj.fxDate][@"w"];
            itemView.dateLabel.text = [DateUtil getYYYYMMDDInfo:obj.fxDate][@"d"];;
            itemView.dayLabel.text = obj.textDay;
            itemView.dayIconLabel.text = [CodeToString getWith:[obj.iconDay intValue]];
            itemView.dayIconLabel.textColor = [ThemeTools getColorWithName:obj.textDay];
            itemView.weatherProgressView.maxTemp = [obj.tempMax intValue];
            itemView.weatherProgressView.minTemp = [obj.tempMin intValue];
            itemView.weatherProgressView.color =[ThemeTools getColorWithName:obj.textDay];
            itemView.nightLabel.text = obj.textNight;
            itemView.nightIconLabel.text =  [CodeToString getWith:[obj.iconNight intValue]];
            itemView.nightIconLabel.textColor = [ThemeTools getColorWithName:obj.textNight];
            [itemView.weatherProgressView reloadData];
        }];
    }];
}



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
    self.backgroundColor = [UIColor whiteColor];
    
    _weekLabel = [[UILabel alloc] init];
    _weekLabel.font = [UIFont systemFontOfSize:15];
    _weekLabel.text = @"五";
    _weekLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
    [self addSubview:_weekLabel];
    
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.font = [UIFont systemFontOfSize:15];
    _dateLabel.text = @"02";
    _dateLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GREY darkColor:COLOR_GREY];
    [self addSubview:_dateLabel];
    
    _dayLabel = [[UILabel alloc] init];
    _dayLabel.font = [UIFont systemFontOfSize:15];
    _dayLabel.text = @"晴";
    _dayLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_dayLabel];
    
    _dayIconLabel = [[UILabel alloc] init];
    _dayIconLabel.font = [UIFont iconfont:25];
    _dayIconLabel.text = @"晴";
    _dayIconLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
    [self addSubview:_dayIconLabel];
    
    _weatherProgressView = [[WeatherProgressView alloc] init];
    _weatherProgressView.maxTemp = 10;
    _weatherProgressView.minTemp = -10;
    [self addSubview:_weatherProgressView];
    
    
    _nightLabel = [[UILabel alloc] init];
    _nightLabel.font = [UIFont systemFontOfSize:15];
    _nightLabel.text = @"晴";
    _nightLabel.textColor = [UIColor colorWithHexLightColor:COLOR_DARK darkColor:COLOR_DARK];
    [self addSubview:_nightLabel];
    
    _nightIconLabel = [[UILabel alloc] init];
    _nightIconLabel.font = [UIFont iconfont:25];
    _nightIconLabel.text = @"晴";
    _nightIconLabel.textColor = [UIColor colorWithHexLightColor:COLOR_GRAY darkColor:COLOR_GRAY];
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
        make.height.equalTo(@140);
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
@property(nonatomic,strong)CATextLayer *textMaxLayer;
@property(nonatomic,strong)CATextLayer *textMinLayer;
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
    //初始化
    self.color = [UIColor orangeColor];
    _lineColor = HexRGB(COLOR_GREY);
    
    
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.lineWidth = 1;
    self.lineLayer.lineDashPattern= @[@4,@4];
    [self.layer addSublayer:self.lineLayer];

    self.tempLayer = [CAShapeLayer layer];
    self.tempLayer.lineWidth = 8;
    self.tempLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:self.tempLayer];
    
    
    self.textMaxLayer = [CATextLayer layer];

    self.textMaxLayer.alignmentMode = kCAAlignmentCenter;
    self.textMaxLayer.wrapped = YES;
    self.textMaxLayer.contentsScale =  [UIScreen mainScreen].scale;
    [self.layer addSublayer:self.textMaxLayer];
    
    self.textMinLayer = [CATextLayer layer];
    self.textMinLayer.contentsScale =  [UIScreen mainScreen].scale;
  
    self.textMinLayer.alignmentMode = kCAAlignmentCenter;
    self.textMinLayer.wrapped = YES;
    [self.layer addSublayer:self.textMinLayer];
    

    //choose a font
    UIFont *font = [UIFont systemFontOfSize:11];
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    self.textMaxLayer.font = fontRef;
    self.textMaxLayer.fontSize = font.pointSize;
    self.textMinLayer.font = fontRef;
    self.textMinLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    
}
-(void)reloadData{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    CGFloat x = rect.size.width/2;
    CGFloat height = rect.size.height;
    
    //计算比例 100° -> height  每度多高
    CGFloat c = 400.0/height;
   
    //2.计算总高度
    CGFloat h = c *(self.maxTemp - self.minTemp);
    
    // 计算开始位置
    CGFloat y = height*2/3.0-self.maxTemp*c;

    CGFloat textH = 14;
    CGFloat space = 3;
    
    //线条区间
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(x, 0)];
    [linePath addLineToPoint:CGPointMake(x, y-textH-space)];
  
    self.textMaxLayer.frame =CGRectMake(0,y-textH-space, rect.size.width, textH);
    self.textMaxLayer.string = [NSString stringWithFormat:@"%d",self.maxTemp];
    self.textMaxLayer.foregroundColor = HexRGB(COLOR_GREY).CGColor;
    
    //温度区间
    UIBezierPath *tempPath = [UIBezierPath bezierPath];
    [tempPath moveToPoint:CGPointMake(x, y)];
    [tempPath addLineToPoint:CGPointMake(x, y+h)];
    
    self.textMinLayer.frame =CGRectMake(0, y+h+space, rect.size.width, textH);
    self.textMinLayer.string =[NSString stringWithFormat:@"%d",self.minTemp];
    self.textMinLayer.foregroundColor = HexRGB(COLOR_GREY).CGColor;
    
    [linePath moveToPoint:CGPointMake(x, y+h+textH+space)];
    [linePath addLineToPoint:CGPointMake(x, height)];
    
    self.lineLayer.path =linePath.CGPath;
    self.lineLayer.strokeColor = _lineColor.CGColor;
    
    self.tempLayer.path =tempPath.CGPath;
    self.tempLayer.strokeColor = self.color.CGColor;
}

@end
