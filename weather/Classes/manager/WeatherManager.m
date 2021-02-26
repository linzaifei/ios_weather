//
//  WeatherManager.m
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "WeatherManager.h"



@implementation WeatherManager

+(instancetype)shareInstance{
    static WeatherManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

-(void)start{
//    QWeatherConfigInstance.publicID = @"";
//    QWeatherConfigInstance.appKey = @"";
//    NSLog(@"%ld",QWeatherVersionNumber );
    
}


@end
