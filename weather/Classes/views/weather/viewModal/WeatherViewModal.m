//
//  WeatherViewModal.m
//  weather
//
//  Created by zifei on 2021/3/4.
//

#import "WeatherViewModal.h"
#import "WeatherManager.h"
@implementation WeatherViewModal
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

-(void)initData{
    
    _nowCommend = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
       
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber){
            [WeatherManager.shareInstance getWeatherInfo:INQUIRE_TYPE_WEATHER_NOW location:input sub:^(WeatherBaseClass * _Nonnull modal) {
                if([modal.code isEqual:@"200"]){
                    [subscriber sendNext:modal.now];
                }else{
                    [subscriber sendNext:nil];
                }
                [subscriber sendCompleted];
            } error:^(NSError * _Nonnull error) {
                [subscriber sendError:error];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
    
    _threeCommend = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber){
            [WeatherManager.shareInstance getWeatherInfo:INQUIRE_TYPE_WEATHER_3D location:input sub:^(WeatherBaseClass * _Nonnull modal) {
                if([modal.code isEqual:@"200"]){
                    NSMutableArray *arr = [modal.daily mutableCopy];
                    [arr removeLastObject];
                    [subscriber sendNext:arr];
                    
                }else{
                    [subscriber sendNext:nil];
                }
                [subscriber sendCompleted];
            } error:^(NSError * _Nonnull error) {
                [subscriber sendError:error];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
    
    _fifteenCommend = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber){
            [WeatherManager.shareInstance getWeatherInfo:INQUIRE_TYPE_WEATHER_15D location:input sub:^(WeatherBaseClass * _Nonnull modal) {
                if([modal.code isEqual:@"200"]){
                    [subscriber sendNext:modal.daily];
                }else{
                    [subscriber sendNext:nil];
                }
                [subscriber sendCompleted];
            } error:^(NSError * _Nonnull error) {
                [subscriber sendError:error];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
    
    _hourCommend = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber){
            [WeatherManager.shareInstance getWeatherInfo:INQUIRE_TYPE_WEATHER_24H location:input sub:^(WeatherBaseClass * _Nonnull modal) {
                if([modal.code isEqual:@"200"]){
                    [subscriber sendNext:modal.hourly];
                }else{
                    [subscriber sendNext:nil];
                }
                [subscriber sendCompleted];
            } error:^(NSError * _Nonnull error) {
                [subscriber sendError:error];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
    
}

@end
