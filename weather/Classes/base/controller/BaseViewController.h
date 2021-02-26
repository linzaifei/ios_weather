//
//  BaseViewController.h
//  justiceRoad
//
//  Created by linzaifei on 2021/1/13.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "justiceRoad.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@end

@interface BaseViewController(navigationBar)
-(CGFloat)statusBarHeight;
-(CGFloat)barHeight;
@end

NS_ASSUME_NONNULL_END
