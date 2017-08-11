//
//  RYTabBarController.m
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/2.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYTabBarController.h"
#import "RYTabBar.h"
#import "RYNavigationController.h"
#import "RYHomeViewController.h"
#import "RYOrderViewController.h"
#import "RYUserViewController.h"

@interface RYTabBarController () <RYTabBarDelegate>

@property (nonatomic, weak) RYTabBar *customTabBar;
@property (nonatomic, strong) NSMutableArray *itemArray;

@end

@implementation RYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置所有的子控制器
    [self setupAllChildViewControllers];
    
    // 2.设置tabBar
    self.customTabBar.items = self.itemArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[RYTabBar class]]) {
            [childView removeFromSuperview];
        }
    }
}

/**
 *  自己定义的tabbar在iOS8 中重叠的情况.就是原本已经移除的UITabBarButton再次出现
 *  在iOS8 是允许动态添加tabbaritem的,这里重新布局时再次做移除操作
 */
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    for (UIView *childView in self.tabBar.subviews) {
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [childView removeFromSuperview];
        }
    }
}

/**
 *  设置所有的子控制器
 */
- (void)setupAllChildViewControllers {
    // 1.首页
    RYHomeViewController *homeTableViewController = [[RYHomeViewController alloc] init];
    [self setupChildViewController:homeTableViewController itemTitle:@"首页" imageName:@"Tabbar_home_normal" selectImageName:@"Tabbar_home_selected"];
    
    // 2.订单
    RYOrderViewController *orderViewController = [[RYOrderViewController alloc] init];
    [self setupChildViewController:orderViewController itemTitle:@"订单" imageName:@"Tabbar_order_normal" selectImageName:@"Tabbar_order_selected"];

    // 3.我的
    RYUserViewController *userViewController = [[RYUserViewController alloc] init];
    [self setupChildViewController:userViewController itemTitle:@"我的" imageName:@"Tabbar_me_normal" selectImageName:@"Tabbar_me_selected"];
}

/**
 *  给控制器添加子控制器
 */
- (void)setupChildViewController:(UIViewController *)viewController itemTitle:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName {
    // 1.设置控制器tabBar的按钮属性
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    viewController.tabBarItem.title = title;
    
    viewController.navigationItem.title = title;
    
    // 2.给自定义的tabBar属性复制
    [self.itemArray addObject:viewController.tabBarItem];
    
    // 3.创建一个导航控制器对象，把控制器设置根控制器
    RYNavigationController *navigationController = [[RYNavigationController alloc] initWithRootViewController:viewController];
    
    // 4.将控制器作为当前的子控制器
    [self addChildViewController:navigationController];
}

/**
 *  懒加载自定义TabBar控件
 */
- (RYTabBar *)customTabBar {
    if (nil == _customTabBar) {
        // 1.把控制器的系统tabBar移除，这里调用移除操作并不会马上销毁，一般在下一次运行循环的时候就会判断这个对象有没有抢引用，如果没有才会销毁
//        [self.tabBar removeFromSuperview];
        
        // 2.创建一个自定义的TabBar对象
        RYTabBar *tabBar = [[RYTabBar alloc] init];
        
        tabBar.delegate = self;
        
        // 3.设置自定义TabBar对象的位置大小
        tabBar.frame = self.tabBar.bounds;
        
        // 4.强引用对象
        _customTabBar = tabBar;
        
        // 5.将自定义TabBar对象添加到当前控制器的视图上
        [self.tabBar addSubview:_customTabBar];
    }
    
    return _customTabBar;
}

/**
 *  懒加载item数组
 */
- (NSMutableArray *)itemArray {
    if (nil == _itemArray) {
        _itemArray = [NSMutableArray array];
    }
    
    return _itemArray;
}

#pragma mark - 代理事件实现
/**
 *  TabBar代理事件
 */
- (void)tabBar:(RYTabBar *)tabBar didClickTabBarButton:(NSInteger)index {
    self.selectedIndex = index;
}

@end

