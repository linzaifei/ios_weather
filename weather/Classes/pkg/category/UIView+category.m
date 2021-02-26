//
//  UIView+category.m
//  justiceRoad
//
//  Created by zifei on 2021/1/22.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "UIView+category.h"
#import <AudioToolbox/AudioToolbox.h>
#import "ReactiveObjC.h"

@implementation UIView (category)


-(void)addGradientColors:(NSArray *)colors{
    if(colors.count==0)return;
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.bounds;
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 0);
    [self.layer insertSublayer:layer atIndex:0];
    
    NSMutableArray *cgcolors = [NSMutableArray array];
    NSMutableArray *locations = [NSMutableArray array];
    CGFloat space = (CGFloat)1/colors.count;
    for (UIColor *color in colors) {
        [cgcolors addObject:(__bridge id)(color.CGColor)];
        [locations addObject:@(space)];
        space+=(CGFloat)1/colors.count;
    }
    layer.colors = cgcolors;
    layer.locations =locations;
}

@end

@implementation UIView(layer)

-(void)addRadius:(CGFloat)radius{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}
-(void)addBorderWidth:(CGFloat)width color:(UIColor*)color{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

-(void)addBorderDirection:(BorderDirectionType)direction color:(UIColor*)color width:(CGFloat)width{
    CALayer*border = [CALayer layer];
    border.backgroundColor= color.CGColor;
    switch (direction) {
        case BorderDirectionTop:
            border.frame=CGRectMake(0.0f,0.0f,self.bounds.size.width, width);
            break;
        case BorderDirectionRight:
            border.frame=CGRectMake(self.bounds.size.width- width,0, width,self.bounds.size.height);
            break;
        case BorderDirectionBottom:
            border.frame=CGRectMake(0.0f,self.bounds.size.height- width,self.bounds.size.width, width);
            break;
        case BorderDirectionLeft:
            border.frame=CGRectMake(0.0f,0.0f, width,self.bounds.size.height);
            break;
        default:
            break;
    }
    [self.layer addSublayer:border];
}

@end

@implementation  UIView (touch)

-(void)addTarget:(void(^)(void))target{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapGesturRecognizer.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        if(target){
            target();
        }
    }];
    [self addGestureRecognizer:tapGesturRecognizer];
}

@end


@implementation UIView (feedback)

+(void)feedback{
    UIImpactFeedbackGenerator*impactLight = [[UIImpactFeedbackGenerator alloc]initWithStyle:UIImpactFeedbackStyleLight];
    [impactLight impactOccurred];
}

@end
