//
//  RYNavigationController.m
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/1.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYNavigationController.h"

@interface RYNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation RYNavigationController

#pragma mark - 控制器加载
/**
 *  加载类的时候调用
 *  当程序已启动的时候就会掉用该方法（在main函数前面掉用）
 */
+ (void)load {
    
}

/**
 *  当前类或者其子类第一次使用的时候才会掉用
 */
+ (void)initialize {
    // 1.获取当前使用类下的导航条:以后经常用这个，因为有些导航条的样式是不需要修改的，如：调用相册时
    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 2.设置导航条的背景颜色
//    [navigationBar ry_setBackgroundColor:[UIColor colorWithHexString:@"#69B93A"]];
    
    // 3.设置导航条标题颜色
    // 3.1.标题富文本属性设置
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    
    titleTextAttributes[NSForegroundColorAttributeName] = RYColorForHex(@"#FFFFFF");
    titleTextAttributes[NSFontAttributeName] = RYChineseFontSize(18.0);
    
    [navigationBar setTitleTextAttributes:titleTextAttributes];
    
    // 4.设置导航栏的主题颜色
    [navigationBar setTintColor:[UIColor whiteColor]];
}

/**
 *  控制器视图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
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

