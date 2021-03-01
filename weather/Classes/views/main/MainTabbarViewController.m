//
//  MainTabbarViewController.m
//  justiceRoad
//
//  Created by linzaifei on 2021/1/13.
//  Copyright © 2021 linzaifei. All rights reserved.
//

#import "MainTabbarViewController.h"

#import "BaseNavigationController.h"
#import "WeatherController.h"
#import "MineController.h"



#import "iconfont.h"
#import "colors.h"


@interface MainTabbarViewController ()
@property(nonatomic,strong)NSMutableArray *tabbarItems;
@end

@implementation MainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createContollers];
    
}

-(void)createContollers{
    NSArray *objs = @[@{@"name":@"WeatherController",@"title":@"天气",@"icon":ic_home,},
                      @{@"name":@"MineController",@"title":@"我的",@"icon":ic_mine,},];

    [objs enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addChildViewController:obj[@"name"] title:obj[@"title"] icon:obj[@"icon"]];
    }];
    self.tabBar.barTintColor = [UIColor colorWithHexLightColor:COLOR_BLACK darkColor:COLOR_BLACK];
}


-(void)addChildViewController:(NSString *)controlName title:(NSString *)title icon:(NSString*)icon{
    UIViewController *control = [[NSClassFromString(controlName) alloc] init];
    BaseNavigationController *baseNavi = [[BaseNavigationController alloc] initWithRootViewController:control];
    control.tabBarItem.image = [UIImage imageIconfont:icon size:22 color:[UIColor colorWithHexLightColor:COLOR_GREY darkColor:COLOR_GREY]];
//    control.tabBarItem.selectedImage = [UIImage imageIconfont:icon size:20 color:[UIColor colorWithHexLightColor:COLOR_THEME darkColor:COLOR_THEME]];
    self.tabBar.tintColor = [UIColor colorWithHexLightColor:COLOR_WHITE darkColor:COLOR_WHITE];
    control.title = title;
    [self addChildViewController:baseNavi];
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    

}

/*
 //    NSLog(@"subviews =%@",self.tabBar.subviews);
 int idx = [NSNumber numberWithUnsignedInteger:[tabBar.items indexOfObject:item]].intValue;
 
 if([self.tabbarItems count]==0){
     for (UIView *view in self.tabBar.subviews) {
         if([view isKindOfClass:NSClassFromString(@"UITabBarButton")]){
             [self.tabbarItems addObject:view];
         }
     }
 }
 
 UIView *subs = self.tabbarItems[idx];
 UIImageView *imgview = (UIImageView*) subs.subviews[0].subviews[0].subviews[0];
 
 CAKeyframeAnimation *keyanim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
 keyanim.values=@[@1,@1.1,@1];
 keyanim.duration=0.3;
 
 [imgview.layer addAnimation:keyanim forKey:nil];
 
 */






-(NSMutableArray *)tabbarItems{
    if(_tabbarItems == nil){
        _tabbarItems = [NSMutableArray array];
    }
    return _tabbarItems;
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
