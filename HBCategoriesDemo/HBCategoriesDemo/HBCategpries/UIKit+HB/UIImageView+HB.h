//
//  UIImageView+HB.h
//  HBCategoriesDemo
//
//  Created by wangfeng on 15/10/18.
//  Copyright (c) 2015年 HustBroventurre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HB)

+ (UIImage *)captureWithView:(UIView *)view;
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
