//
//  UIButton+WF.m
//  WeiXin
//
//  Created by Yong Feng Guo on 14-11-18.
//  Copyright (c) 2014年 Fung. All rights reserved.
//

#import "UIButton+WF.h"

@implementation UIButton (WF)

-(void)setN_BG:(NSString *)nbg H_BG:(NSString *)hbg{
    [self setBackgroundImage:[UIImage imageNamed:nbg] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:hbg] forState:UIControlStateHighlighted];
}


-(void)setResizeN_BG:(NSString *)nbg H_BG:(NSString *)hbg{
    [self setBackgroundImage:[UIImage stretchedImageWithName:nbg] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage stretchedImageWithName:hbg] forState:UIControlStateHighlighted];
}

- (void)centerImageAndTitle:(CGFloat)spacing
{
        // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
        // get the height they will take up as a unit
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
        // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), titleSize.width, 0,0 );

        // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(
                                            0, - imageSize.width, - (totalHeight - titleSize.height), 0);

}@end
