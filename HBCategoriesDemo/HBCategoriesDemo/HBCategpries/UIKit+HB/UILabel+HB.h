//
//  UILabel+HB.h
//  HBCategoriesDemo
//
//  Created by wangfeng on 15/10/18.
//  Copyright (c) 2015年 HustBroventurre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HB)

- (void)resizeLabelBoundsWithNewText:(NSString*)text;
- (void)resizeLabelBoundsWithNewText:(NSString*)text maxWidth:(CGFloat)maxWidth;

@end
