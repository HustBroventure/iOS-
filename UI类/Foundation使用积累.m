//
//  Foundation使用积累
//
//
//  Created by wangfeng on 15-4-19.
//
//
#import <Foundation/Foundation.h>
#pragma mark 0 直接量得到对象

-(void)soulution
{
    NSString* string = @"string";
    NSNumber* number = @2;
    NSArray* array = @[@"111",@"222",@"333"];
    NSDictionary* NSDictionary = @{@"111":@"first"，@"222":@"second",@"333":@"third"};
}
#prama mark  1 NSDate 获取时间

	NSdate* nowDate = [NSDate date];
	[date descriptionWithLocale:[NSLocale currentLocale]];//获取当前时区:Wednesday, November 26, 2014 at 8:30:53 PM China Standard Time,日期时间
	//dateFormat设置格式
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm"];//小写h就是显示12小时制
                                                       //时间到时间string
	"NSDate *date=[dateFormatter dateFromString:dateString];"
	//将NSDate转化为字符串
	"NSString *dateString=[dateFormatter stringFromDate:date];"
	
	
	//跨时区的话要设置时区
	[formatter setTimeZone:timeZone];
	//一般的用法就这些
	//获取星期几
	NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]]; 
	int weekday = [componets weekday];//1就是星期日，7是星期6

#prama mark 2 NSString

	使用最多，最灵活的
		
	别忘了可以使用NSMutableString

		1)  得到NSString：
			直接量；已经有的String；NSData对象；文件；NSURL对象；拷贝；返回为NSString对象；归档
		2） NSString转化为UTF-8 URLEcoder
				NSString*str=[s stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];

				NSString*result=[str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		3）得到subString；
			使用NSRange
				NSString* str = @"wangfengis good ii";
				NSRange range = [str rangeOfString:@"i"];
				NSLog(@"%d,%d",range.length,range.location);//1,8
				NSString* subStr = [str substringToIndex:range.location];//index前边的
				NSLog(@"%@",subStr);//wangfeng	
		4)   componentsSeparatedByString:@":"
3  常用的结构体
	
	NSRange{location,lenth}
	NSPoint{x,y};
	NSSize{width,height}
	NSRect{point,size}
	NSRange  range = NSMakeRange()
    NSSize size = CGRect()

    //打印时候使用
NSString stringFromXXX

4  NSMutableArray
	可以实现队列的功能
			在前边插入
					insertObject:atIndex:
					removeObjectAtIndex:
					addObject:
					removeLastObject
					replaceObjectAtIndex:withObject:
					
		添加的时候注意不为nil；使用时注意初始化；
			
			@[],便利数组  @加数字直接转化为NSValue类型
			@{name：@"www"}便利字典
				
	写入属性列表文件也是很方便的
				
5  NSDictionary					

#prama mark  6随机数
    通过arc4random() 获取0到x-1之间的整数的代码如下：
int value = arc4random() % x;
		推荐使用下边这种。
int value =arc4random_uniform(x ＋ 1);
		生成随机正整数


