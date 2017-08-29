//
//  ViewController.m
//  右侧滑出筛选项
//
//  Created by WangXueqi on 17/8/29.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ViewController.h"
#import "SizerViewController.h"

#define WEAK_SELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define K_ScreenWidth   CGRectGetWidth([[UIScreen mainScreen] bounds])//当前屏幕宽
#define K_ScreenHeight  CGRectGetHeight([[UIScreen mainScreen] bounds])//当前屏幕高

@interface ViewController ()
@property(nonatomic,strong)UIView *upView;
@property(nonatomic,strong)UIWindow *window;
@property(nonatomic,strong)UILabel *showLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.showLabel];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"筛选" style:UIBarButtonItemStyleDone target:self action:@selector(showRight:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (UILabel *)showLabel {

    if (!_showLabel) {
        _showLabel= [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
        _showLabel.text = @"选择项";
        _showLabel.textAlignment = NSTextAlignmentCenter;
        _showLabel.textColor = [UIColor blackColor];
    }
    return _showLabel;
}

//点击筛选按钮，出现筛选页面
- (void)showRight:(UIButton *)sender {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_ScreenWidth, K_ScreenHeight)];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0;
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [view addGestureRecognizer:tap];
    [self.view addSubview:view];
    self.upView = view;
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(K_ScreenWidth, 0, K_ScreenWidth-100, K_ScreenHeight)];
    window.backgroundColor = [[UIColor clearColor]colorWithAlphaComponent:0.7];
    window.windowLevel = UIWindowLevelNormal;
    window.hidden = NO;
    [window makeKeyAndVisible];
    self.window = window;
    
    SizerViewController *sizer = [[SizerViewController alloc] init];
    sizer.tap = ^{
        [self tapAction];
    };
    sizer.clickCell = ^(NSString *chooseStr, NSInteger index){
        self.showLabel.text = [NSString stringWithFormat:@"%@,%ld",chooseStr,(long)index];
    };
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sizer];
    sizer.view.frame = window.bounds;
    window.rootViewController = nav;
    
    [UIView animateWithDuration:0.5f animations:^{
        self.upView.alpha = 0.5;
        self.window.frame = CGRectMake(100, 0, K_ScreenWidth-100, K_ScreenHeight);
    }];
}

- (void)tapAction {

    [UIView animateWithDuration:0.5f animations:^{
        self.upView.alpha = 0;
        self.window.frame = CGRectMake(K_ScreenWidth, 0, K_ScreenWidth-100, K_ScreenHeight);
    }completion:^(BOOL finished) {
        [self.window resignKeyWindow];
        [self.upView removeFromSuperview];
        self.window  = nil;
        self.upView = nil;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
