###iOS微信支付实现
####1.pre
微信平台ID

####2.设置步骤

1.注册，urlType
2.处理回调：方法中判断
 return [WXApi handleOpenURL:url delegate:self];
 
 ```
 - (void)onResp:(BaseResp *)resp
{
    if ([resp isKindOfClass:[PayResp class]])
    {
        PayResp *response = (PayResp *)resp; 
        NSString *strTitle = [NSString stringWithFormat:@"支付结果"];
        NSString *strMsg = [NSString stringWithFormat:@"errcode:%d", response.errCode];
        
             
        switch (response.errCode) {
            case WXSuccess: {
                NSNotification *notification = [NSNotification notificationWithName:ORDER_PAY_NOTIFICATION object:@"success"];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
                break;
            }
                
            default: {
                NSNotification *notification = [NSNotification notificationWithName:ORDER_PAY_NOTIFICATION object:@"fail"];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
                break;
            }
        }
    }
}
 ```

