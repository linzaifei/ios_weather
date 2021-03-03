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
#import "HourModal.h"

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif
@interface WeatherController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation WeatherController

- (void)viewDidLoad {
    [super viewDidLoad];
   

  
    
       
    [self layoutView];
    
 

}


-(void)layoutView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    self.scrollView.contentSize = self.view.frame.size;
    [self.view addSubview:self.scrollView];
    
    
    SunWeatherView *sun = [[SunWeatherView alloc] init];
    sun.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:sun];
    
    PreviewView *previewView = [[PreviewView alloc] init];
    [self.scrollView addSubview:previewView];
   
    NSDictionary *dic = [Files readLocalJsonWithName:@"hour"];
    NSArray *dataArr = [HourModal mj_objectArrayWithKeyValuesArray:dic[@"hourly"]];
    HourView *hourView = [[HourView alloc] init];
    hourView.dataArr = dataArr;
    [self.scrollView addSubview:hourView];
    
    
    DayView *dayView = [[DayView alloc] init];
    [self.scrollView addSubview:dayView];
    
    @weakify(self,previewView,sun,hourView);
    [sun mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.left.equalTo(@10);
        make.width.equalTo(@(self.view.frame.size.width-20));
    }];
    [previewView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(sun);
        make.left.right.equalTo(sun);
        make.top.equalTo(sun.mas_bottom).offset(15);
        make.height.equalTo(@100);
    }];
    
    [hourView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(previewView);
        make.left.right.equalTo(previewView);
        make.top.equalTo(previewView.mas_bottom).offset(15);
    }];
    
    [dayView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self,hourView);
        make.left.right.equalTo(hourView);
        make.top.equalTo(hourView.mas_bottom).offset(15);
        make.bottom.equalTo(self.scrollView.mas_bottom);
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
