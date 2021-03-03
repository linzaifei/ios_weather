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
@interface WeatherController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation WeatherController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = self.view.frame.size;
    
    
    
    SunWeatherView *sun = [[SunWeatherView alloc] init];
    sun.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:sun];
    
    PreviewView *previewView = [[PreviewView alloc] init];
    [self.scrollView addSubview:previewView];
    
    
    DayView *dayView = [[DayView alloc] init];
    
    [self.scrollView addSubview:dayView];
    
    
    [sun mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@10);
        make.width.equalTo(@(self.view.frame.size.width-20));
    }];
    [previewView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(sun);
        make.top.equalTo(sun.mas_bottom).offset(15);
        make.height.equalTo(@100);
    }];
    
    [dayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(previewView);
        make.top.equalTo(previewView.mas_bottom).offset(15);
    }];
    
    
    
    [self.view addSubview:self.scrollView];
    
    
    
 

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
