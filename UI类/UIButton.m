1  UIButton的创建
+(id) buttonWithType:(UIButtonType)buttonType //不能返回子类的实例，得到一个位置为0，0，0，0，0的按钮

typedef enum {
   UIButtonTypeCustom = 0,
   UIButtonTypeSystem,
   UIButtonTypeDetailDisclosure,
   UIButtonTypeInfoLight,
   UIButtonTypeInfoDark,
   UIButtonTypeContactAdd,
   UIButtonTypeRoundedRect,
} UIButtonType;



2  UIButton的属性设置
   大小
   位置
   标题  
currentTitle  
	   @property(nonatomic, readonly, retain) UILabel *titleLabel
	   - (NSString *)titleForState:(UIControlState)state   
	    - (void)setTitle:(NSString *)title forState:(UIControlState)state
			
   背景
   颜色  - (UIColor *)titleColorForState:(UIControlState)state
			- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
						
						
						@property(nonatomic, readonly, retain) UIImage *currentImage

									currentBackgroundImage
									
									

												@property(nonatomic, readonly, retain) UIImageView *imageView
									
   状态
   事件
   
3  事件


4  继承UIResponder
Responding to Touch Events：

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
5  手势

iOS系统在3.2以后，为方便开发这使用一些常用的手势，提供了UIGestureRecognizer类。手势识别UIGestureRecognizer类是个抽象类，下面的子类是具体的手势，开发这可以直接使用这些手势识别。

创建手势实例。当创建手势时，指定一个回调方法，当手势开始，改变、或结束时，回调方法被调用。
添加到需要识别的View中。一个手势只能对应一个View，但是一个View可以有多个手势

#pragma mark new

6:
iOS7之后label计算size

在官方文档里可以看到，- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode这个函数在iOS7里面已经deprecated了，取而代之的是boundingRectWithSize:options:attributes:context:这个函数。实际上这两个函数在iOS7里面的计算结果是一致的，都是带小数的。boundingRectWithSize:options:attributes:context:的文档中可以看到这么一句话：

This method returns fractional sizes (in the size component of the returned CGRect); to use a returned size to size views, you must use raise its value to the nearest higher integer using the ceil function.
也就是说，计算出的size需要用ceil函数取整。


NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
NSDictionary *attributes = @{NSFontAttributeName:someFont, NSParagraphStyleAttributeName:paragraphStyle.copy};

labelSize = [someText boundingRectWithSize:CGSizeMake(207, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
/*
 This method returns fractional sizes (in the size component of the returned CGRect); to use a returned size to size views, you must use raise its value to the nearest higher integer using the ceil function.
 */
labelSize.height = ceil(labelSize.height);
labelSize.width = ceil(labelSize.width);

7

UILineBreakModeWordWrap = 0,
以单词为单位换行，以单位为单位截断。
UILineBreakModeCharacterWrap,
以字符为单位换行，以字符为单位截断。
UILineBreakModeClip,
以单词为单位换行。以字符为单位截断。
UILineBreakModeHeadTruncation,
以单词为单位换行。如果是单行，则开始部分有省略号。如果是多行，则中间有省略号，省略号后面有4个字符。
UILineBreakModeTailTruncation,
以单词为单位换行。无论是单行还是多行，都是末尾有省略号。
UILineBreakModeMiddleTruncation,
以单词为单位换行。无论是单行还是多行，都是中间有省略号，省略号后面只有2个字符。

/设置lable中文字过长时的显示格式
lbl3.lineBreakMode = UILineBreakModeMiddleTruncation; //截去中间
                                                      //    typedef enum{
                                                      //        UILineBreakModeWordWrap = 0,
                                                      //        UILineBreakModeCharacterWrap,
                                                      //        UILineBreakModeClip,//截去多余部分
                                                      //        UILineBreakModeHeadTruncation,//截取头部 
                                                      //        UILineBreakModeTailTruncation,//截去尾部 
                                                      //        UILineBreakModeMiddleTruncation,//截去中间 
                                                      //    }U