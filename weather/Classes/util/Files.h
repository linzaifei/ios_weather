//
//  Files.h
//  justiceRoad
//
//  Created by zifei on 2021/1/29.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Files : NSObject
/** 读取本地json文件 */
+(id)readLocalJsonWithName:(NSString*)fileName;


@end

NS_ASSUME_NONNULL_END
