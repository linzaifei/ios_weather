//
//  BaseViewController.m
//  justiceRoad
//
//  Created by linzaifei on 2021/1/13.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "BaseViewController.h"
#import "justiceRoad.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexLightColor:COLOR_BG darkColor:COLOR_BG];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


@implementation BaseViewController(navigationBar)

-(CGFloat)statusBarHeight{
    return  [UIApplication sharedApplication].statusBarFrame.size.height;
}

-(CGFloat)barHeight{
   
    return self.navigationController.navigationBar.frame.size.height + [self statusBarHeight];
}

@end
