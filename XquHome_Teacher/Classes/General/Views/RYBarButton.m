//
//  RYBarButton.m
//  XquHome_Teacher
//
//  Created by Rainer on 2017/8/2.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYBarButton.h"

@implementation RYBarButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12.0];
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.width;
    CGFloat imageH = self.height * 0.7;
    
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleX = 0;
    CGFloat titleY = CGRectGetMaxY(self.imageView.frame);
    CGFloat titleW = self.width;
    CGFloat titleH = self.height - self.imageView.height;
    
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}


@end
