//
//  ViewController.m
//  HBCategoriesDemo
//
//  Created by wangfeng on 15/10/18.
//  Copyright (c) 2015年 HustBroventurre. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+HB.h"
#import "UILabel+HB.h"
#import "UIColor+HB.h"
@interface ViewController ()
@property (nonatomic, strong) UILabel* midLabel;
@property (nonatomic, strong) UIButton* confirmButton;
@property (nonatomic, strong) UIImageView* topImageView;
@property (nonatomic, strong) UIImage* topImage;
@property (nonatomic, strong) UIColor* bgColor;

@end

@implementation ViewController

#pragma mark - vc-life-circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.midLabel];
    self.midLabel.center = self.view.center;
    [self.view addSubview:self.confirmButton];
    self.confirmButton.center = CGPointMake(self.view.center.x, self.view.center.y + 80) ;
    [self.view addSubview:self.topImageView];
        // self.topImageView.frame = CGRectMake(0, 0, 200, 200);

        self.topImageView.center = CGPointMake(self.view.center.x, self.view.center.y - 180 ) ;


    self.view.backgroundColor = [UIColor gradientFromColor:[UIColor greenColor] toColor:[UIColor blackColor] withHeight:self.view.frame.size.height];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark - private-tools methords
- (void)initData
{

}
#pragma mark - property-setter-getter
-(UILabel *)midLabel
{
    if (!_midLabel) {
        _midLabel = [UILabel new];
        _midLabel.text = @"text";
        _midLabel.font = [UIFont systemFontOfSize:16];
        _midLabel.textColor = [UIColor whiteColor];
        _midLabel.backgroundColor = [UIColor greenColor];
        _midLabel.textAlignment = NSTextAlignmentCenter;
        _midLabel.numberOfLines = 1;
        _midLabel.adjustsFontSizeToFitWidth = YES;
            //求出适应内容的size，然后设置这个size为bounds的size
        [_midLabel sizeToFit ];
            //_midLabel.bounds = CGRectMake(0, 0,  self.view.frame.size.width,40);


    }
    return _midLabel;
}
-(UIButton *)confirmButton
{
    if (!_confirmButton) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.backgroundColor = [UIColor orangeColor];
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
         _confirmButton.titleLabel.font = [UIFont systemFontOfSize:18];
            //[_confirmButton setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
        [_confirmButton setImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
        _confirmButton.layer.cornerRadius = 4.0f;
        _confirmButton.clipsToBounds = YES;
            //[_confirmButton sizeToFit];
        _confirmButton.bounds = CGRectMake(0, 0, 120, 90);
        [_confirmButton addTarget:self action:@selector(buttonClicick) forControlEvents:UIControlEventTouchUpInside];
        [_confirmButton verticalImageAndTitle:5];
    }
    return _confirmButton;
}
-(UIImageView *)topImageView
{
    if (!_topImageView) {
        _topImageView = [UIImageView new];
        _topImageView.userInteractionEnabled = YES;
        _topImageView.contentMode = UIViewContentModeCenter;
        _topImageView.image = [UIImage imageNamed:@"22"];
        _topImageView.backgroundColor = [UIColor redColor];
            //_topImageView.bounds = CGRectMake(0, 0, 160, 160);
        [_topImageView sizeToFit];

    }
    return _topImageView;
}

#pragma mark - event methords
-(void)buttonClicick
{
     NSLog(@"%s",__func__);
//    self.midLabel.text = @"哈哈哈哈哈哈哈自动改变";
//     self.midLabel = [self.midLabel resizeLabelHorizontal:0];

        //self.midLabel.text = @"自动改变的label 还有谁自动改变的label 还有谁自动改变的label 还有谁自动改变的label 还有谁自动改变的label 还有谁";
        [self.midLabel resizeLabelBoundsWithNewText:@"自动改变的label 还有谁自动改变的label 还有谁自动改变的label 还有谁自动改变的label 还有谁自动改变的label 还有谁" maxWidth:self.view.frame.size.width];
    self.topImageView.image = [UIImage imageNamed:@"11"];

}
#pragma mark - delegate methords


@end
