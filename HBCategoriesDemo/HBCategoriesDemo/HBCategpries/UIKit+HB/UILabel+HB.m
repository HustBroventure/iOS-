//
//  UILabel+HB.m
//  HBCategoriesDemo
//
//  Created by wangfeng on 15/10/18.
//  Copyright (c) 2015年 HustBroventurre. All rights reserved.
//

#import "UILabel+HB.h"

@implementation UILabel (HB)


- (void)resizeLabelBoundsWithNewText:(NSString*)text;
{
    [self resizeLabelBoundsWithNewText:text maxWidth:CGFLOAT_MAX];
}
- (void)resizeLabelBoundsWithNewText:(NSString*)text maxWidth:(CGFloat)maxWidth
{
    if (!text) {
        return;
    }
    self.text = text;
    CGRect newBounds = self.bounds;
    CGSize constrainedSize = CGSizeMake(CGFLOAT_MAX, newBounds.size.height);
    UIFont *font = self.font;
    CGSize size = CGSizeZero;
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};

        size = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }else{
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED <= 60000)
        size = [text sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
#endif
    }
    if (ceilf(size.width) < maxWidth) {
         newBounds.size.width = ceilf(size.width);
    }else{
         newBounds.size.width = maxWidth;
        newBounds.size.height = ceilf(size.height);


    }

    self.bounds = newBounds;

}
@end
