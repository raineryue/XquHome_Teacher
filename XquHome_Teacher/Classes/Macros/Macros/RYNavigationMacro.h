//
//  RYNavigationMacro.h
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/1.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#ifndef RYNavigationMacro_h
#define RYNavigationMacro_h

// 导航Frame
#define RYStaturHeight                      [[UIApplication sharedApplication] statusBarFrame].size.height
#define RYNavigationBarHeight               (self.navigationController.navigationBar.frame.size.height)
#define RYInvalidViewHeight                 (RYStaturHeight + RYNavigationBarHeight)

#endif /* Header_h */
