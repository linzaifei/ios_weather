//
//  utils.m
//  justiceRoad
//
//  Created by linzaifei on 2021/1/15.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "utils.h"
#import "Reg.h"
@implementation utils

+(NSString *)hiddenTelephone:(NSString*)telephone{
    if(![Reg checkTelephone:telephone]){
        return @"";
    }
    NSRange range = NSMakeRange(3, 4);
//    [telephone stringByReplacingCharactersInRange:range withString:@"****"];
    return  [telephone stringByReplacingCharactersInRange:range withString:@"****"];;
}
@end
