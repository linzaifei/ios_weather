//
//  ViewController.m
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "ViewController.h"
#import "SunView.h"
#import "RainView.h"
#import "SnowView.h"
#import <Masonry/Masonry.h>
#import "UIImage+category.h"
#import "CloudView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:scrollView];
    
    
    SunView *sun = [[SunView alloc] init];
    [scrollView addSubview:sun];
    
    CloudView *cloud = [[CloudView alloc] init];
    
    [scrollView addSubview:cloud];
    
    
    
    RainView *rain = [[RainView alloc] init];
    rain.rainType = RainTypeNormal;
    rain.colors = @[[UIColor clearColor],[UIColor redColor]];
    [scrollView addSubview:rain];
    
    SnowView *snow = [[SnowView alloc] init];
    [scrollView addSubview:snow];
    
    [sun mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.left.equalTo(@10);
        make.width.equalTo(@(self.view.frame.size.width-20));
        make.height.equalTo(@260);
    }];
    [cloud mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sun.mas_bottom).offset(20);
        make.left.equalTo(@10);
        make.width.equalTo(sun.mas_width);
        make.height.equalTo(@260);
    }];
    
    
    [rain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cloud.mas_bottom).offset(20);
        make.left.equalTo(@10);
        make.width.equalTo(sun.mas_width);
        make.height.equalTo(@260);
    }];
    
    [snow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rain.mas_bottom).offset(20);
        make.left.equalTo(@10);
        make.width.equalTo(sun.mas_width);
        make.height.equalTo(@260);
    }];
    
    
    
    
}


@end
