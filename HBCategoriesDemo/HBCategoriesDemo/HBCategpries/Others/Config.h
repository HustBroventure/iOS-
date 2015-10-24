//
//  Config.h
//  HBCategoriesDemo
//
//  Created by wangfeng on 15/10/24.
//  Copyright (c) 2015年 HustBroventurre. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  机型的尺寸，系统的版本
    常用的颜色配置，
    常用的宽，高，和size

 */
@interface Config : NSObject

-(BOOL)is3Point5Inch;
-(BOOL)is4Inch;
-(BOOL)is4Point7Inch;
-(BOOL)is5Point5Inch;
-(BOOL)isIOS9;
-(BOOL)isIOS8;
-(BOOL)isIOS7Point1;
-(BOOL)isIOS7;

@end
