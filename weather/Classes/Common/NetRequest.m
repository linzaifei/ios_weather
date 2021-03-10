//
//  NetRequest.m
//  weather
//
//  Created by zifei on 2021/3/10.
//

#import "NetRequest.h"
#import <AFNetworking/AFNetworking.h>
@implementation NetRequest

+ (void)post:(NSString *)url params:(NSDictionary *)params{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
/**
?=&key=
 */
    [manager POST:url parameters:params headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)get:(NSString*)url params:(NSDictionary*)params success:(SuccessBlock)block fail:(FailBlock)fail{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:params headers:@{} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(block){
            block(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
    

    
  
    
}
@end
