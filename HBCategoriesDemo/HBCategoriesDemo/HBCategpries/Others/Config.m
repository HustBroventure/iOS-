    //
    //  Config.m
    //  HBCategoriesDemo
    //
    //  Created by wangfeng on 15/10/24.
    //  Copyright (c) 2015年 HustBroventurre. All rights reserved.
    //

#import "Config.h"
#import <UIKit/UIKit.h>
@implementation Config


-(BOOL)is3Point5Inch
{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
        double height = [[UIScreen mainScreen] bounds].size.height;
        if (fabs(height-480.0f) < DBL_EPSILON) {
            return YES;
        }
    }
    return NO;
}
-(BOOL)is4Inch
{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
        double height = [[UIScreen mainScreen] bounds].size.height;
        if (fabs(height-568.0f) < DBL_EPSILON) {
            return YES;
        }
    }
    return NO;
}
-(BOOL)is4Point7Inch
{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
        double height = [[UIScreen mainScreen] bounds].size.height;
        if (fabs(height-667.0f) < DBL_EPSILON) {
            return YES;
        }
    }
    return NO;
}

-(BOOL)is5Point5Inch
{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
        double height = [[UIScreen mainScreen] bounds].size.height;
        if (fabs(height-736.0f) < DBL_EPSILON) {
            return YES;
        }
    }
    return NO;
}

-(BOOL)isIOS8
{
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version > 7.9  & version < 9.0 ) {
        return YES;
    }
    return NO;
}
-(BOOL)isIOS9
{
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version > 8.9  & version < 10.0 ) {
        return YES;
    }
    return NO;
}
-(BOOL)isIOS7
{
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version > 6.9  & version < 8.0 ) {
        return YES;
    }
    return NO;
}
-(BOOL)isIOS7Point1
{
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version > 7.0  & version < 8.0 ) {
        return YES;
    }
    return NO;
}
@end
