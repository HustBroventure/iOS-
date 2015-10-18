//UITableView  demo解析
 //首先是dataSource协议
1  "最先执行section，在执行section中cell的数量，在执行每次cell的绘制(只重复屏幕显示的cell)，最后执行头尾文字"
1>数据数量：（section+num）;2>计算每一行行高(优先级最高)；3>绘制表格(只重复屏幕显示的cell);4>
reloadData 上述过程会循环。当cell不可见时会回收，重新可见事会重新调用cell，index.row绘制。

为了计算出contentSize

如果每一行的行高相同，不要使用代理方法，而要使用属性设置
2	上拉加载，加载20条，data加入20个对象，reloadData，当data过大，比如超过400，则前边的删除，
下拉刷新，将最新的数据下载，然后添加到data的前边，reloadData。

上拉加载，可以设置每次加载则加载一个section

直接使用UIRefreshController


    // 设置refreshControl属性，该属性值应该是UIRefreshControl控件
self.refreshControl = [[UIRefreshControl alloc]init];
    // 设置UIRefreshControl控件的颜色
self.refreshControl.tintColor = [UIColor grayColor];
    // 设置该控件的提示标题
self.refreshControl.attributedTitle = [[NSAttributedString alloc]
                                       initWithString:@"下拉刷新"];
    // 为UIRefreshControl控件的刷新事件设置事件处理方法
[self.refreshControl addTarget:self action:@selector(refreshData)
              forControlEvents:UIControlEventValueChanged];



    // 刷新数据的方法
- (void) refreshData
{
        // 使用延迟2秒来模拟远程获取数据


				[self performSelector:@selector(handleData) withObject:nil afterDelay:1];
}
- (void) handleData
{
        // 获取一个随机数字符串
				NSString* randStr = [NSString stringWithFormat:@"%d"
                                     , arc4random() % 10000];
        // 将随机数字符串添加list集合中
				[list addObject:randStr];
				self.refreshControl.attributedTitle = [[NSAttributedString alloc]
                                                       initWithString:@"正在刷新..."];
        // 停止刷新
				[self.refreshControl endRefreshing];
        // 控制表格重新加载数据
				[self.tableView reloadData];
}

3  编辑左划删除
    // Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
        // Return NO if you do not want the specified item to be editable.
    return YES;
}

    // Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
        {
            // Delete the row from the data source
        [self.cityData removeObjectAtIndex:indexPath.row];
        [self.cityData writeToFile:[self filePath] atomically:YES];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }

    else if (editingStyle == UITableViewCellEditingStyleInsert)
        {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";

}


4  更改状态栏
    //状态栏显示白色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
    //隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
5  更改导航条背景
    //颜色
[[UINavigationBar appearance] setBarTintColor:[UIColor redColor]]
    //背景图片，记得把translunt属性设置为no
[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavBar64"]
                                   forBarMetrics:UIBarMetricsDefault];
    //更改返回按钮文字颜色
[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //更改返回的图标
[[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
[[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_b"]];
    //设置标题为背景
self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"appcoda-logo.png"]];
    //设置标题颜色
[UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
6  设置键盘退出
resignFirstResponDer


7 UIWebView

[webView goBack];//返回

[webView goForward];//向前
[webView reload];//重新加载数据
[webView stopLoading];//停止加载数据

委托

1.-(BOOL)webView:(UIWebView *)webView  shouldStartLoadWithRequest:(NSURLRequest *)request

navigationType:(UIWebViewNavigationType)navigationType;

web视图指示加载内容时通知。应该返回YES开始加载。导航提供的类型参数，是指请求的来源，可以是下列任何一个：
UIWebViewNavigationTypeLinkClicked
UIWebViewNavigationTypeFormSubmitted
UIWebViewNavigationTypeBackForward
UIWebViewNavigationTypeReload
UIWebViewNavigationTypeFormResubmitted
UIWebViewNavigationTypeOther

2.-(void)webViewDidStartLoad:(UIWebView *)webView;//当开始请求的时候被通知
3.-(void)webViewDidFinishLoad:(UIWebView *)webView;//当结束请求的时候被通知
4.-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;//当请求中出现错误时被通知

7）UIWebView和JS交互

1》在Objective-C代码中调用JS

使用stringByEvaluatingJavaScriptFromString方法，需要等到UIWebView中的页面加载完成之后去调用。

-(void) webViewDidFinishLoad:(UIWebView *)webView{

    [self.activityViewstopAnimating];


					   //不仅能调用，还能添加
    [myWebView stringByEvaluatingJavaScriptFromString:@"function test(){ alert(‘123123123’)}"];

    [myWebView stringByEvaluatingJavaScriptFromString:@"test();"];//调用

}
2》在JS中调用Objective-C代码

JS代码：
function sendCommand(cmd,param){
    var url="testapp:"+cmd+":"+param;
    document.location = url;
}
function clickLink(){
    sendCommand("alert","你好吗？");
}

Objective-C代码：
    //在这个方法中根据请求判断哪个jS方法，然后调用本地的methord
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSString *requestString = [[request URL] absoluteString];  //testapp:alert:%E4%BD%A0%E5%A5%BD%E5%90%97%EF%BC%9F
    NSArray *components = [requestString componentsSeparatedByString:@":"];
    if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"testapp"])
        {
            if([(NSString *)[components objectAtIndex:1] isEqualToString:@"alert"])
                {
                    UIAlertView *alert = [[UIAlertView alloc]
                                          initWithTitle:@"Alert from Cocoa Touch" message:[components objectAtIndex:2]
                                          delegate:self cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
                    [alert show];
                }
            return NO;
        }
    return YES;
}
8.- (UIImage *)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight

这个函数是UIImage的一个实例函数，它的功能是创建一个内容可拉伸，而边角不拉伸的图片，需要两个参数，第一个是不拉伸区域和左边框的宽度，第二个参数是不拉伸区域和上边框的宽度。

CGFloat top = 25; // 顶端盖高度
CGFloat bottom = 25 ; // 底端盖高度
CGFloat left = 10; // 左端盖宽度
CGFloat right = 10; // 右端盖宽度
UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];

参数的意义是，如果参数指定10，5。那么，图片左边10个像素，上边5个像素。不会被拉伸，x坐标为11和一个像素会被横向复制，y坐标为6的一个像素会被纵向复制。注意：只是对一个像素进行复制到一定宽度。
9  定位问题
在plist文件中添加了NSLocationAlwaysUsageDescription   NSLocationWhenInUseDescription 两个字段，声明CLLocationManager对象后也添加了代码[locationManager requestAlwaysAuthorization];
[self.locationManager requestAlwaysAuthorization];
[self.locationManager requestWhenInUseAuthorization];

10  UIButton

1）常见用法：
创建UIButton

UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
btn.frame = CGRectMake(30, 360, 90, 35);

[btn setTitle:@"ZoomIn" forState:UIControlStateNormal];
[btn setTitle:@"ZoomIn" forState:UIControlStateHighlighted];
[btn addTarget:self action:@selector(zoomInAction:) forControlEvents:UIControlEventTouchUpInside];
    //addSubview:btn

获取按钮状态

title: forState:


UIButton要回灵活使用，buttn包含了image和label，还可以添加事件处理机制



- (void)sizeToFit //得到最适合当前字数的尺寸，
11
UIViewController中loadView, viewDidLoad, viewWillUnload, viewDidUnload, viewWillAppear, viewDidAppear, viewWillLayoutSubviews，viewDidLayoutSubviews，viewWillDisappear, viewDidDisappear






