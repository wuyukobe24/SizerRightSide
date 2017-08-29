//
//  SizerViewController.h
//  右侧滑出筛选项
//
//  Created by WangXueqi on 17/8/29.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SizerViewController : UIViewController
//在灰色部分点击返回上个页面的block
@property(nonatomic,copy)void(^tap)();
//选中cell后在上个页面显示带回去的值的block
@property(nonatomic,copy)void(^clickCell)(NSString *chooseStr, NSInteger index);
@end
