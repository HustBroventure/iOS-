//
//  UIColor+HB.h
//  HBCategoriesDemo
//
//  Created by wangfeng on 15/10/18.
//  Copyright (c) 2015年 HustBroventurre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HB)

+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)randomColor;
    //渐变
+ (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;
@end
