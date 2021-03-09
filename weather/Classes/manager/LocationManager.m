//
//  LocationManager.m
//  weather
//
//  Created by zifei on 2021/3/9.
//

#import "LocationManager.h"

static NSString * const KEY = @"2H4Tb9TjPv5yb1OG8bv1sFa2rlnBcmQ7";

@interface LocationManager()<BMKLocationAuthDelegate,BMKLocationManagerDelegate>
@property(nonatomic,strong)BMKLocationManager *locationManager;
@end
@implementation LocationManager

static LocationManager *_manager = nil;
+(instancetype)shareLocation{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _manager = [[LocationManager alloc] init];
    });
    return _manager;
}

-(void)initSDK{
    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:KEY authDelegate:self];
}

-(void)startLocation:(LocationBlock)block{
    //初始化实例
    _locationManager = [[BMKLocationManager alloc] init];
    //设置delegate
    _locationManager.delegate = self;
    //设置返回位置的坐标系类型
    _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
    //设置距离过滤参数
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    //设置预期精度参数
    _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    //设置应用位置类型
    _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
    //设置是否自动停止位置更新
    _locationManager.pausesLocationUpdatesAutomatically = NO;
    //设置是否允许后台定位
    //_locationManager.allowsBackgroundLocationUpdates = YES;
    //设置位置获取超时时间
    _locationManager.locationTimeout = 10;
    //设置获取地址信息超时时间
    _locationManager.reGeocodeTimeout = 10;
    
    [_locationManager requestLocationWithReGeocode:YES withNetworkState:NO completionBlock:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
        if (error){
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
        }
        if (location) {//得到定位信息，添加annotation
            if(block){
                block(location);
            }
        }
    }];
}

#pragma mark --- BMKLocationManagerDelegate
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager doRequestAlwaysAuthorization:(CLLocationManager * _Nonnull)locationManager{
    [locationManager requestAlwaysAuthorization];
    
    
}

#pragma mark --- BMKLocationAuthDelegate
- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError{
    
    
}

@end
