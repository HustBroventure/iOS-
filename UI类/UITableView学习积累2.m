//
//  UITableView学习积累2.m
//  iOS开发积累
//
//  Created by wangfeng on 15/10/15.
//  Copyright (c) 2015年 HustBroventurre. All rights reserved.
//

@"Plain 和Grouped"

plain一般是循环使用的,groud一般是静态的,所以tableView的使用在于两点静态和循环的

1.静态tableView的使用

    内容写入固定数组中：标题，图片，右边的view，
    难点在于分组和动态的显示与隐藏
    往往是设置页面

2.循环利用


3.用法积累

设置：

    //行高
@property (nonatomic)          CGFloat                     rowHeight;             // will return the default value if unset
@property (nonatomic)          CGFloat                     sectionHeaderHeight;   // will return the default value if unset
@property (nonatomic)          CGFloat                     sectionFooterHeight;   //



    // Data

- (void)reloadData;                 // reloads everything from scratch. redisplays visible rows. because we only keep info about visible rows, this is cheap. will adjust offset if table shrinks
- (void)reloadSectionIndexTitles NS_AVAILABLE_IOS(3_0);   // reloads the index bar.

    // Info

- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (CGRect)rectForSection:(NSInteger)section;                                    // includes

- (NSIndexPath *)indexPathForCell:(UITableViewCell *)cell;                      // returns nil if cell is not visible

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;            // returns nil if cell is not visible or index path is out of range

- (UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section ;
- (UITableViewHeaderFooterView *)footerViewForSection:(NSInteger)section;
- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

- (void)scrollToNearestSelectedRowAtScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

    // Row insertion/deletion/reloading.

- (void)beginUpdates;   // allow multiple insert/delete of rows and sections to be animated simultaneously. Nestable
- (void)endUpdates;     // only call insert/delete/reload calls or change the editing state inside an update block.  otherwise things like row count, etc. may be invalid.

- (void)insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
- (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);
- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection NS_AVAILABLE_IOS(5_0);

- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);
- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath NS_AVAILABLE_IOS(5_0);

    // Editing. When set, rows show insert/delete/reorder controls based on data source queries

@property (nonatomic, getter=isEditing) BOOL editing;                             // default is NO. setting is not animated.
- (void)setEditing:(BOOL)editing animated:(BOOL)animated;

@property (nonatomic) BOOL allowsSelection NS_AVAILABLE_IOS(3_0);  // default is YES. Controls whether rows can be selected when not in editing mode
@property (nonatomic) BOOL allowsSelectionDuringEditing;                                     // default is NO. Controls whether rows can be selected when in editing mode
@property (nonatomic) BOOL allowsMultipleSelection NS_AVAILABLE_IOS(5_0);                 // default is NO. Controls whether multiple rows can be selected simultaneously
@property (nonatomic) BOOL allowsMultipleSelectionDuringEditing NS_AVAILABLE_IOS(5_0);   // default is NO. Controls whether multiple rows can be selected simultaneously in editing mode

    // Selection

- (NSIndexPath *)indexPathForSelectedRow;                                                // returns nil or index path representing section and row of selection.
- (NSArray *)indexPathsForSelectedRows NS_AVAILABLE_IOS(5_0); // returns nil or a set of index paths representing the sections and rows of the selection.

    // Selects and deselects rows. These methods will not call the delegate methods (-tableView:willSelectRowAtIndexPath: or tableView:didSelectRowAtIndexPath:), nor will it send out a notification.
- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;
- (void)deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;

    // Appearance

@property (nonatomic, retain) UIColor *sectionIndexColor
@property (nonatomic, retain) UIColor *sectionIndexBackgroundColor NS_AVAILABLE_IOS(7_0) ;
@property (nonatomic, retain) UIColor *sectionIndexTrackingBackgroundColor

@property (nonatomic) UITableViewCellSeparatorStyle separatorStyle; // default is UITableViewCellSeparatorStyleSingleLine
@property (nonatomic, retain) UIColor              *separatorColor UI_APPEARANCE_SELECTOR; // default is the standard separator gray

@property (nonatomic, retain) UIView *tableHeaderView;                           // accessory view for above row content. default is nil. not to be confused with section header
@property (nonatomic, retain) UIView *tableFooterView;                           // accessory view below content. default is nil. not to be confused with section footer


- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0); // newer dequeue method guarantees a cell is returned and resized properly, assuming identifier is registered


- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier
- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return _contacts.count;
}
#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组(组%i)行数",section);
    return group1.contacts.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    return cell;
}

#pragma mark 返回每组头标题名称
    // fixed font style. use custom view (UILabel) if you want something different

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"生成组（组%i）名称",section);
    return name;
}

#pragma mark 返回每组尾部说明
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSLog(@"生成尾部（组%i）详情",section);
    return group.detail;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

}
#pragma mark 返回每组标题索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSLog(@"生成组索引");
       return indexs;
}

#pragma mark - 代理方法
#pragma mark 设置分组标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0){
        return 50;
    }
    return 40;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

#pragma mark 设置尾部说明内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;   // custom view for header. will be adjusted to default or specified header height
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;   // custom view for footer. will be adjusted to default or specified footer height
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath NS_DEPRECATED_IOS(2_0, 3_0);
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;
#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}