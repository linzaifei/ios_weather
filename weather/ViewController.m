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
#import "MoonView.h"
@interface ViewController ()
@property(nonatomic,strong)UIScrollView *scrollView ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:self.scrollView];
    
    
    
    SunView *sun = [[SunView alloc] init];
    [self.scrollView addSubview:sun];
    
    CloudView *cloud = [[CloudView alloc] init];
    [self.scrollView addSubview:cloud];
    MoonView *moon = [[MoonView alloc] init];
    [self.scrollView addSubview:moon];
    
    
//    UIImageView *imagview = [[UIImageView alloc] init];
//    imagview.image = [UIImage imageNamed:@"undraw_sweet_home_dkhr"];
//    [self.scrollView addSubview:imagview];

    RainView *rain = [[RainView alloc] init];
    rain.rainType = RainTypeNormal;
    rain.colors = @[[UIColor clearColor],[UIColor redColor]];
    [self.scrollView addSubview:rain];

    SnowView *snow = [[SnowView alloc] init];
    [self.scrollView addSubview:snow];
    

    [sun mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.left.equalTo(@10);
        make.width.equalTo(@(self.view.frame.size.width-20));
        make.height.equalTo(@260);
    }];
    [moon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sun.mas_bottom).offset(20);
        make.left.equalTo(@10);
        make.width.equalTo(sun.mas_width);
        make.height.equalTo(@260);
    }];
    
    [cloud mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(moon.mas_bottom).offset(20);
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
        make.bottom.equalTo(self.scrollView.mas_bottom);
    }];
 
    
    
    
    
    
}


@end
