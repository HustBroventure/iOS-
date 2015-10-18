//
//  iOS开发技巧积累
//
//
//  Created by wangfeng on 15-4-19.
//  Copyright (c) 2015年 fengpro. All rights reserved.
//

#prama mark 1.log调试

/**
 *  自定义Log,课放入pch文件
 */
#ifdef DEBUG

#define ECLog(...) NSLog(@"行号:%d方法名:%s\n %@\n\n",__LINE__,__func__,[NSString stringWithFormat:__VA_ARGS__])

#else
#define ECLog(...)

#endif

#prama mark 2.模拟器和真机的区别对待

#if TARGET_IPHONE_SIMULATOR

#define HOST_NAME  @"127.0.0.1"

#elif TARGET_OS_IPHONE

#define HOST_NAME  @"192.168.1.242"
#endif

#prama mark 3.pch文件的使用
在pch中定义宏，添加全局包含的头文件
1)新建pch文件
2)build setting中查找prefixheader

$(SRCROOT)/项目名/XX.pch


#prama mark 4.单例类的使用
1)便捷设置
    // .h
#define singleton_interface(class) + (instancetype)shared##class;

    // .m
#define singleton_implementation(class) \
static class *_instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
\
return _instance; \
} \
\
+ (instancetype)shared##class \
{ \
if (_instance == nil) { \
_instance = [[class alloc] init]; \
} \
\
return _instance; \
}

2)保存全局的信息：举例，记录登录信息

/**
 *  单例类的声明
 */
{

    /**
     *  登录的状态 YES 登录过/NO 注销
     */
    @property (nonatomic, assign) BOOL  loginStatus;

    @property (nonatomic, copy) NSString *user;//用户名
    @property (nonatomic, copy) NSString *pwd;//密码
    @property (nonatomic, copy) NSString *registerUser;//注册的用户名
    @property (nonatomic, copy) NSString *registerPwd;//注册的密码

    /**
     *  从沙盒里获取用户数据
     */
    -(void)loadUserInfoFromSanbox;
    
    /**
     *  保存用户数据到沙盒
     */
    -(void)saveUserInfoToSanbox;

}
{


#define UserKey @"user"
#define LoginStatusKey @"LoginStatus"
#define PwdKey @"pwd"

    -(void)saveUserInfoToSanbox
    {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.user forKey:UserKey];
    [defaults setBool:self.loginStatus forKey:LoginStatusKey];
    [defaults setObject:self.pwd forKey:PwdKey];
    [defaults synchronize];

    }

    -(void)loadUserInfoFromSanbox
    {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.user = [defaults objectForKey:UserKey];
    self.loginStatus = [defaults boolForKey:LoginStatusKey];
    self.pwd = [defaults objectForKey:PwdKey];
    }
    

}

{
        // 从沙里加载用户的数据到单例
    [[ECUserInfo sharedECUserInfo] loadUserInfoFromSanbox];

        // 判断用户的登录状态，YES 直接来到主界面
    if([ECUserInfo sharedECUserInfo].loginStatus){
        UIStoryboard *storayobard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.window.rootViewController = storayobard.instantiateInitialViewController;

}

#pragma mark 5常用的扩展
    详细见资源
    {

    /**
     * 设置普通状态与高亮状态的背景图片
     */
    -(void)setN_BG:(NSString *)nbg H_BG:(NSString *)hbg;

    /**
     * 设置普通状态与高亮状态的拉伸后背景图片
     */
    -(void)setResizeN_BG:(NSString *)nbg H_BG:(NSString *)hbg;
    }
    {
    -(void)setN_BG:(NSString *)nbg H_BG:(NSString *)hbg{
        [self setBackgroundImage:[UIImage imageNamed:nbg] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:hbg] forState:UIControlStateHighlighted];
    }


    -(void)setResizeN_BG:(NSString *)nbg H_BG:(NSString *)hbg{
        [self setBackgroundImage:[UIImage stretchedImageWithName:nbg] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage stretchedImageWithName:hbg] forState:UIControlStateHighlighted];
    }

    }

#pragma mark 6tabBar和导航栏的的定制
    1)tabBar
        //设置选中的的渲染色
    [self.tabBar setTintColor:[UIColor colorWithRed:31.0/255 green:179.0/255 blue:191.0/255 alpha:1]];

    //设置选中的的渲染图片
    UITabBarItem* item =  self.tabBar.items[0];
    UITabBarItem* item1 =  self.tabBar.items[1];
    UITabBarItem* item2 =  self.tabBar.items[2];
    item.selectedImage = [UIImage imageNamed:@"tabbar_mainframeHL"];

    item1.selectedImage = [UIImage imageNamed:@"tabbar_contactsHL"];
    item2.selectedImage = [UIImage imageNamed:@"tabbar_discoverHL"];

        //normal图片可以在storyboard中设置

    2)UINavigationBar

    UINavigationBar *navBar = [UINavigationBar appearance
                               ];
        // 1.设置导航条的背景

        // 高度不会拉伸，但是宽度会拉伸
    [navBar setBackgroundImage:[UIImage imageNamed:@"NaviBg"] forBarMetrics:UIBarMetricsDefault];
    [navBar setTintColor:[UIColor whiteColor]];
        //barTintColor 为背景色,tintColor为按钮字体颜色


    如果要想将导航栏标题修改为一个图片或者logo，那么只需要使用下面这行代码即可：
        //设置标题为view
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"appcoda-logo.png"]];
        //设置按钮
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];

    NSArray *actionButtonItems = @[shareItem, cameraItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;


        //全局设置状态栏颜色
    在iOS 7中，通过上面的方法来修改状态栏风格非常的棒。另外，我们也可以使用UIApplication的statusBarStyle方法来设置状态栏，不过，首先需要停止使用View controller-based status bar appearance。在project target的Info tab中，插入一个新的key，名字为View controller-based status bar appearance，并将其值设置为NO。

        //隐藏状态栏
    - (BOOL)prefersStatusBarHidden
    {
    return YES;
    }


    #pragma mark 7 重要

    xcode6使用了launch.xib就不会使用兼容模式，否则，6和6P都是兼容，且点数都为320和568，所以，autolayout也没啥用，如果需要开发支持ios7的。直接设置frame

"断点调试"

