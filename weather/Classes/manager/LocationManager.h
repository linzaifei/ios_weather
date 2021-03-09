//
//  LocationManager.h
//  weather
//
//  Created by zifei on 2021/3/9.
//

#import <Foundation/Foundation.h>
#import <BMKLocationkit/BMKLocationComponent.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^LocationBlock)(BMKLocation *location);
@interface LocationManager : NSObject

+(instancetype)shareLocation;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

-(void)initSDK;

-(void)startLocation:(LocationBlock)block;


@end

NS_ASSUME_NONNULL_END
