//
//  RYNavigationController.m
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/1.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYNavigationController.h"

UIColor *MainNavBarColor = nil;

@interface RYNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation RYNavigationController

#pragma mark - 控制器加载
/**
 *  控制器视图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置手势返回
    [self setupGestureRecognizer];
    
    // 设置导航栏样式
    [self setupNavBarAppearence];
}

/**
 设置手势返回
 */
- (void)setupGestureRecognizer {
    // 其实这里的self.interactivePopGestureRecognizer.delegate即为系统滑动返回手势的target，可以省掉以上使用运行时的代码
    // 自定义滑动手势（用来实现滑动返回功能，非系统提供的边缘滑动返回）
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wundeclared-selector"
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
#pragma clang diagnostic pop
    // 设置手势代理
    panGestureRecognizer.delegate = self;
    
    // 添加自定义手势到视图上
    [self.view addGestureRecognizer:panGestureRecognizer];
}

/**
 设置导航栏样式
 */
- (void)setupNavBarAppearence {
    MainNavBarColor = RYColorForRGB(0, 175, 240);
    
    // 设置导航栏默认的背景颜色
    [UIColor wr_setDefaultNavBarBarTintColor:MainNavBarColor];
    // 设置导航栏所有按钮的默认颜色
    [UIColor wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
    // 设置导航栏标题默认颜色
    [UIColor wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    // 统一设置状态栏样式
    [UIColor wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    // [UIColor wr_setDefaultNavBarShadowImageHidden:YES];
    
//    // 3.设置导航条标题颜色
//    // 3.1.标题富文本属性设置
//    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
//
//    titleTextAttributes[NSForegroundColorAttributeName] = RYColorForHex(@"#FFFFFF");
//    titleTextAttributes[NSFontAttributeName] = RYChineseFontSize(18.0);
//
//    [navigationBar setTitleTextAttributes:titleTextAttributes];
}

#pragma mark - 父类方法重写
/**
 *  复写导航控制器的pushViewController:animated:方法，实现非根控制器跳转底部TabBar视图的隐藏
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 1.这里判断当前导航控制器中的控制器总个数是否为0:如果为0则表示只有根控制器，不需要隐藏底部视图；如果不为0则表示有其他控制器，则需要隐藏底部视图
    if (self.viewControllers.count != 0) {
        // 1.1.隐藏需要push的控制器的底部TabBar视图
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 1.2.设置统一的非根控制器返回按钮的背景图片
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderingModeAlwaysOriginal:@"navigation_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemClickAction:)];
    }
    
    // 2.调用super的该方法实现跳转（这里必须放在最后，否则在根控制器时就会隐藏底部视图）
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 手势代理方法

/**
 *  返回该手势是否开始
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 判断当前栈顶控制器是否等于当前控制器中的第一个控制器，如果是则表示为根控制器，那么就不允许该手势开始
    return (self.topViewController != [self.viewControllers firstObject]);
}

#pragma mark - 控件点击事件
/**
 *  导航栏返回按钮点击事件处理
 */
- (void)backBarButtonItemClickAction:(UIBarButtonItem *)backBarButtonItem {
    [self popViewControllerAnimated:YES];
}

@end

