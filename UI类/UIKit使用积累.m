

#import <Foundation/Foundation.h>
#import<UIKit/UIKit.h>
    //获取图片的类型
+ (NSString *)sd_contentTypeForImageData:(NSData *)data {
uint8_t c;
[data getBytes:&c length:1];
switch (c) {
    case 0xFF:
        return @"image/jpeg";
    case 0x89:
        return @"image/png";
    case 0x47:
        return @"image/gif";
    case 0x49:
    case 0x4D:
        return @"image/tiff";
    case 0x52:
            // R as RIFF for WEBP
        if ([data length] < 12) {
            return nil;
        }
        
        NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
        if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
            return @"image/webp";
        }
        
        return nil;
}
return nil;
}
+(void)authCodeCountdown:(UIButton *)btn{
    __block int timeout=59; //倒计时时间
    btn.userInteractionEnabled = false;
    [btn setTitleColor:COLOR_DARKRGB  forState:UIControlStateNormal];
    NSString *btnTitle=btn.titleLabel.text;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [btn setTitle:btnTitle forState:UIControlStateNormal];
                btn.userInteractionEnabled = YES;
                [btn setTitleColor:COLOR_LIGHTRED forState:UIControlStateNormal];
                [btn setTitle:@"重新获取"  forState:UIControlStateNormal];
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [btn setTitle:[NSString stringWithFormat:@"重新获取(%@)",strTime] forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
#pragma mark - -导航条
