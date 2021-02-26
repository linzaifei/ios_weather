//
//  Reg.m
//  justiceRoad
//
//  Created by zifei on 2021/1/29.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "Reg.h"

@implementation Reg

+(BOOL)checkTelephone:(NSString*)telephone{
    if (telephone.length !=11) {
        return NO;
    }
    // 以1开头,11位
    NSString *MOBILE = @"(^1\\d{10}$)";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:telephone];
}

@end
