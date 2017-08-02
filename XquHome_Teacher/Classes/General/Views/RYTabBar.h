//
//  RYTabBar.h
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/2.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RYTabBar;

@protocol RYTabBarDelegate <NSObject>

@optional
- (void)tabBar:(RYTabBar *)tabBar didClickTabBarButton:(NSInteger)index;

@end

@interface RYTabBar : UIView

@property (nonatomic, strong) NSArray<UITabBarItem *> *items;

@property (nonatomic, weak) id<RYTabBarDelegate> delegate;

@end
