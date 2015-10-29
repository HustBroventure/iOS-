#UINavigationBar

1. 高度44，继承自UIView，item的容器，包括topItem，backItem,itemss数组管理

2. 属性：barTintColor 背景色
        translucent  半透明效果，如果图片背景是不透明的则自动为NO
        tintColor 子控件的染色
        
#UINavigationItem
要展示的button、view的集合

1.title，titleView，prompt

1. backBarButtonItem
2. leftItemsSupplementBackButton 默认为no，如果存在leftitem,则不显示backItem
3. left right   item(s)  设置的话可以动画


#UIBarItem
title
image
#UIBarButtonItem
style
action
customView

###1push2  2 back1
2015-10-29 17:32:30.767 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewDidLoad]

2015-10-29 17:32:30.768 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewWillAppear:]
2015-10-29 17:32:30.801 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewDidAppear:]

2015-10-29 17:32:31.739 HBNavigationBarDemo[14468:2081258] 222-[ViewController2 viewDidLoad]

2015-10-29 17:32:31.739 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewWillDisappear:]
2015-10-29 17:32:31.741 HBNavigationBarDemo[14468:2081258] 222-[ViewController2 viewWillAppear:]
2015-10-29 17:32:32.247 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewDidDisappear:]
2015-10-29 17:32:32.247 HBNavigationBarDemo[14468:2081258] 222-[ViewController2 viewDidAppear:]


2015-10-29 17:32:33.060 HBNavigationBarDemo[14468:2081258] 222-[ViewController2 viewWillDisappear:]
2015-10-29 17:32:33.060 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewWillAppear:]
2015-10-29 17:32:33.563 HBNavigationBarDemo[14468:2081258] 222-[ViewController2 viewDidDisappear:]
2015-10-29 17:32:33.564 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewDidAppear:]

###2 gesture cancle
2015-10-29 17:39:59.035 HBNavigationBarDemo[14468:2081258] 222-[ViewController2 viewWillDisappear:]
2015-10-29 17:39:59.035 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewWillAppear:]

2015-10-29 17:40:01.382 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewWillDisappear:]
2015-10-29 17:40:01.382 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewDidDisappear:]
2015-10-29 17:40:01.382 HBNavigationBarDemo[14468:2081258] 222-[ViewController2 viewWillAppear:]
2015-10-29 17:40:01.382 HBNavigationBarDemo[14468:2081258] 222-[ViewController2 viewDidAppear:]

###2 gesture confirm

2015-10-29 17:41:25.917 HBNavigationBarDemo[14468:2081258] 222-[ViewController2 viewWillDisappear:]
2015-10-29 17:41:25.917 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewWillAppear:]

2015-10-29 17:41:28.232 HBNavigationBarDemo[14468:2081258] 222-[ViewController2 viewDidDisappear:]
2015-10-29 17:41:28.232 HBNavigationBarDemo[14468:2081258] 111-[ViewController viewDidAppear:]


delloc最后调用

###model
2015-10-29 17:53:44.998 HBNavigationBarDemo[14825:2193035] 111-[ViewController viewDidLoad]
2015-10-29 17:53:44.999 HBNavigationBarDemo[14825:2193035] 111-[ViewController viewWillAppear:]
2015-10-29 17:53:45.045 HBNavigationBarDemo[14825:2193035] 111-[ViewController viewDidAppear:]

2015-10-29 18:01:33.213 HBNavigationBarDemo[14961:2235069] 222-[ViewController2 viewDidLoad]
2015-10-29 18:01:33.215 HBNavigationBarDemo[14961:2235069] 111behind -[ViewController present:]
2015-10-29 18:01:33.217 HBNavigationBarDemo[14961:2235069] 111-[ViewController viewWillDisappear:]
2015-10-29 18:01:33.236 HBNavigationBarDemo[14961:2235069] 222-[ViewController2 viewWillAppear:]
2015-10-29 18:01:33.739 HBNavigationBarDemo[14961:2235069] 222-[ViewController2 viewDidAppear:]
2015-10-29 18:01:33.739 HBNavigationBarDemo[14961:2235069] 111-[ViewController viewDidDisappear:]
2015-10-29 18:01:33.739 HBNavigationBarDemo[14961:2235069] block __26-[ViewController present:]_block_invoke

2015-10-29 18:04:11.705 HBNavigationBarDemo[15028:2249677] 222behind -[ViewController2 close:]
2015-10-29 18:04:11.706 HBNavigationBarDemo[15028:2249677] 222-[ViewController2 viewWillDisappear:]
2015-10-29 18:04:11.707 HBNavigationBarDemo[15028:2249677] 111-[ViewController viewWillAppear:]
2015-10-29 18:04:12.209 HBNavigationBarDemo[15028:2249677] 111-[ViewController viewDidAppear:]
2015-10-29 18:04:12.210 HBNavigationBarDemo[15028:2249677] 222-[ViewController2 viewDidDisappear:]
2015-10-29 18:04:12.210 HBNavigationBarDemo[15028:2249677] 222block __25-[ViewController2 close:]_block_invoke
2015-10-29 18:04:12.210 HBNavigationBarDemo[15028:2249677] 222-[ViewController2 dealloc]

###应用启动
2015-10-29 17:47:05.362 HBNavigationBarDemo[14684:2146911] -[AppDelegate application:didFinishLaunchingWithOptions:]
2015-10-29 17:48:23.589 HBNavigationBarDemo[14684:2146911] 111-[ViewController viewDidLoad]
2015-10-29 17:48:23.589 HBNavigationBarDemo[14684:2146911] 111-[ViewController viewWillAppear:]
2015-10-29 17:48:23.621 HBNavigationBarDemo[14684:2146911] -[AppDelegate applicationDidBecomeActive:]
2015-10-29 17:48:23.652 HBNavigationBarDemo[14684:2146911] 111-[ViewController viewDidAppear:]


2015-10-29 17:49:48.908 HBNavigationBarDemo[14684:2146911] -[AppDelegate applicationWillResignActive:]
2015-10-29 17:49:49.434 HBNavigationBarDemo[14684:2146911] -[AppDelegate applicationDidEnterBackground:]

2015-10-29 17:50:21.910 HBNavigationBarDemo[14684:2146911] -[AppDelegate applicationWillEnterForeground:]
2015-10-29 17:50:22.428 HBNavigationBarDemo[14684:2146911] -[AppDelegate applicationDidBecomeActive:]

#UITabBarItem


selectedImage