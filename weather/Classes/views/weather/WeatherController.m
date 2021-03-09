//
//  WeatherController.m
//  weather
//
//  Created by zifei on 2021/3/1.
//

#import "WeatherController.h"
#import "iconfont.h"
#import "WeatherView.h"
#import "PreviewView.h"
#import "DayView.h"
#import "HourView.h"
#import "Files.h"

#import "WeatherViewModal.h"
#import "UIView+category.h"
#import "DateUtil.h"
#import "ThemeTools.h"
#import "LocationView.h"
#import "LocationManager.h"
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

@interface WeatherController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,copy)NSString *locationId;
@property(nonatomic,strong)WeatherView *weathView;

@property(nonatomic,strong)LocationView *locationView;
@property(nonatomic,strong)PreviewView *previewView;
@property(nonatomic,strong) HourView *hourView;
@property(nonatomic,strong)DayView *dayView;



@end

@implementation WeatherController

- (void)viewDidLoad {
    [super viewDidLoad];

    [ThemeTools getColorWithName:@"晴"];
    

    self.locationId =@"101010100";
    
    
    [self getLocation];
    [self layoutView];
    [self handleData];
    [self setNavigation];
    @weakify(self);
    [[RACObserve(self, locationId) skip:1] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        NSLog(@"location改变 %@",x);
        [self handleData];
    }];
    
}

#pragma mark -- 设置导航栏
-(void)setNavigation{
    self.locationView = [[LocationView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView: self.locationView ];
    self.navigationItem.title = @"";
}
#pragma mark --- 获取定位
-(void)getLocation{
    @weakify(self);
    [[LocationManager shareLocation] startLocation:^(BMKLocation * _Nonnull location) {
        @strongify(self);
        BMKLocationReGeocode *rgcData = location.rgcData;
        self.locationId = [NSString stringWithFormat:@"%f,%f",location.location.coordinate.latitude,location.location.coordinate.longitude];
        self.locationView.cityLabel.text = rgcData.city;
        self.locationView.areaLabel.text = [NSString stringWithFormat:@"%@%@%@",rgcData.district,rgcData.street,rgcData.locationDescribe];
    }];
}

#pragma mark --- 天气数据请求
-(void)handleData{
    
    WeatherViewModal *model = [[WeatherViewModal alloc] init];
    @weakify(self);
    [[model.nowCommend execute:self.locationId] subscribeNext:^(Now* _Nullable x) {
        @strongify(self);
        self.weathView.now = x;
        [self.weathView reload];
    }];
    
    [[model.hourCommend execute:self.locationId] subscribeNext:^(NSArray* _Nullable x) {
        @strongify(self);
        self.hourView.dataArr = x;
        [self.hourView reload];
    }];
    
    [[model.fifteenCommend execute:self.locationId] subscribeNext:^(NSArray* _Nullable x) {
        @strongify(self);
        self.dayView.dataArr = x;
        [self.dayView reload];
        
        self.weathView.daily = [x firstObject];
        [self.weathView reload];
    }];
    
    [[model.threeCommend execute:self.locationId] subscribeNext:^(NSArray* _Nullable x) {
        @strongify(self);
        self.previewView.dataArr = x;
        [self.previewView reload];
    }];
}

#pragma mark --- 天气试图
-(void)layoutView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.weathView = [[WeatherView alloc] init];
    [self.scrollView addSubview:self.weathView];
    [self.weathView addShadow];
    
    
    self.previewView = [[PreviewView alloc] init];
    [self.scrollView addSubview:self.previewView];
    [self.previewView addShadow];
    

    self.hourView = [[HourView alloc] init];
    [self.scrollView addSubview:self.hourView];
    [self.hourView addShadow];
    
    
    self.dayView = [[DayView alloc] init];
    [self.scrollView addSubview:self.dayView];
    [self.dayView addShadow];
    
    @weakify(self);
    [self.weathView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.left.equalTo(@10);
        make.width.equalTo(@(self.view.frame.size.width-20));
    }];
    [self.previewView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.right.equalTo(self.weathView);
        make.top.equalTo(self.weathView.mas_bottom).offset(15);
    }];
    
    [ self.hourView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.right.equalTo(self.previewView);
        make.top.equalTo(self.previewView.mas_bottom).offset(15);
    }];
    
    [self.dayView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.right.equalTo( self.hourView);
        make.top.equalTo( self.hourView.mas_bottom).offset(15);
        make.bottom.equalTo(self.scrollView.mas_bottom).offset(-20);
    }];
    
//    [self.scrollView setContentOffset:CGPointMake(0, 100) animated:YES];
}

//-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    CGPoint offset = self.scrollView.contentOffset;
//    CGPoint newOffset = CGPointMake(offset.x+50, offset.y);
//    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAutoreverse |UIViewAnimationOptionRepeat animations:^{
//        [UIView setAnimationRepeatCount: 2];
//        [self.scrollView setContentOffset:newOffset animated: YES];
//    } completion:^(BOOL finished) {
//        [self.scrollView setContentOffset:offset animated:NO];
//    }];
//}
@end
