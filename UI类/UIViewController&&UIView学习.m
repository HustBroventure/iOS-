//
//  UIViewController&&UIView学习.m
//  
//
//  Created by wangfeng on 15-4-9.
//
//

#parma mark 1.vc布局相关
/*
1》automaticallyAdjustsScrollViewInsets:设置属性默认设置为YES，所以如果出现scrollView
，则scroolView的bounds的原点会改变，同样自己的InSets=也会改变。

这个属性的目的是仅仅让开发者考虑去除naviBar和tabBar所占据frame的影响。
 */
/*
2》edgesForExtendedLayout
通过此属性，可以设置self.view的frame为不包含bar,但是没有了透明的穿透效果
 */

"2.UIView实用总结"

1》UIView的frame和bounds的问题
bounds默认点为(0,0)如果设置了，则上边的subView将以设置的点作为原点（方向为反方向）
运用技巧：如果仅仅想设置size则可设置bounds,然后在设置center确定位置

2》contentMode

UIViewContentModeScaleToFill,
UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
UIViewContentModeTop,
UIViewContentModeBottom,
UIViewContentModeLeft,
UIViewContentModeRight,
UIViewContentModeTopLeft,
UIViewContentModeTopRight,
UIViewContentModeBottomLeft,
UIViewContentModeBottomRight,


以上几个常量，凡是没有带Scale的，当图片尺寸超过 ImageView尺寸时，只有部分显示在ImageView中。UIViewContentModeScaleToFill属性会导致图片变形。UIViewContentModeScaleAspectFit会保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。UIViewContentModeScaleAspectFill也会证图片比例不变，但是是填充整个ImageView的，可能只有部分图片显示出来。


#parma mark 3.vc跳转
1.segue
    //都会执行此方法，通过segue的identify和sender来判断
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    //特定动作时，可以指定触发，比如不同行的表格，跳转到不同的vc
-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
    //设置segue是否有效
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
2.UIStoryboard获取vc对象
UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
// 获取故事板中某个View

UIViewController *next = [board instantiateViewControllerWithIdentifier:@"111"];

initWithNibName;
    //设置fistOwner，关联view
ViewController2* next = [[ViewController2 alloc]initWithNibName:@"View"bundle:nil];
    //view
[[[NSBundle  mainBundle]  loadNibNamed:@"UISpecialTableViewCell" owner:self options:nil]  lastObject];


#parma mark 4.webView使用技巧

    //根据webView的大小设置frame的高度
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight;"] floatValue];
    self.m_webView.frame = CGRectMake(0, 65, 320, height);
    self.m_scroll.contentSize = CGSizeMake(320, height+60);

}


#parma mark 5. 处理naviitem



    //自定义下一个界面返回按钮文字
UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
self.navigationItem.backBarButtonItem = item;

UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithTitle:@"分享" style: UIBarButtonItemStylePlain target:self action:@selector(share)];

self.navigationItem.rightBarButtonItem = rightItem;


6.设置 透明效果

