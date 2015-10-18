"iOS开发进阶学习笔记——AutoLayout"

代码实现Autolayout的步骤
利用NSLayoutConstraint类创建具体的约束对象
添加约束对象到相应的view上
- (void)addConstraint:(NSLayoutConstraint *)constraint;
- (void)addConstraints:(NSArray *)constraints;

代码实现Autolayout的注意点
要先禁止autoresizing功能，设置view的下面属性为NO
view.translatesAutoresizingMaskIntoConstraints = NO;
添加约束之前，一定要保证相关控件都已经在各自的父控件上
不用再给view设置frame

"1 autoResing回顾"

使用autoresing就不能使用autolayout

