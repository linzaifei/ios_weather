//
//  Links.h
//  justiceRoad
//
//  Created by linzaifei on 2021/1/17.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const WebKey = @"695c1fa265ac4c3080018e128e80191a";

@interface Links : NSObject

typedef NSString LinkTypes NS_STRING_ENUM;
//分钟级降雨
FOUNDATION_EXPORT LinkTypes *const minutely;




@end

NS_ASSUME_NONNULL_END
