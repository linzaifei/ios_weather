//
//  NetRequest.h
//  weather
//
//  Created by zifei on 2021/3/10.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id _Nullable obj);
typedef void(^FailBlock)(NSError * _Nullable error);
NS_ASSUME_NONNULL_BEGIN

@interface NetRequest : NSObject
+(void)post:(NSString*)url params:(NSDictionary*)params;

+(void)get:(NSString*)url params:(NSDictionary*)params success:(SuccessBlock)block fail:(FailBlock)fail;

@end

NS_ASSUME_NONNULL_END
