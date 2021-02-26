//
//  Files.m
//  justiceRoad
//
//  Created by zifei on 2021/1/29.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "Files.h"

@implementation Files
+(id)readLocalJsonWithName:(NSString*)fileName{
    if(!fileName){
        @throw [NSException exceptionWithName:@"readLocalJsonWithName" reason:@"文件名为空" userInfo:nil];
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if(error){
        @throw [NSException exceptionWithName:@"readLocalJsonWithName" reason:@"读取文件错误" userInfo:nil];
    }
    return jsonObj;
}
@end
