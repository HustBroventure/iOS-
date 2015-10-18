//
//  UIImage+HB.m
//  HBCategoriesDemo
//
//  Created by wangfeng on 15/10/18.
//  Copyright (c) 2015年 HustBroventurre. All rights reserved.
//

#import "UIImage+HB.h"

@implementation UIImage (HB)

+ (UIImage*)imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
