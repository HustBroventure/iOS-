1  获取沙盒目录
	

	//获取ios应用文件路径
	-(NSString*)filePath
	{
	    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	    NSString* documentDictionary = [paths objectAtIndex:0];
	    return [NSString stringWithFormat:@"%@/cityList.plist",documentDictionary];
	}
	//获取tmp目录
	NSTemporary();
	//判断是否存在
	[NSFileManager defaultManager] fileExistsAtPath:[self filePath]
		//读写采用集合类响应的writr和init方法  写入到属性列表中
	
2  保存数据到NSUserDefault
			获取单例对象
				setXXX  foKey
				
					syncheronize保存
						
						读的话直接   XXforkey
3 数据库
								CoreData
								