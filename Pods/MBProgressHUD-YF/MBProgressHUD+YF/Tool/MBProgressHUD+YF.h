//
//  MBProgressHUD+YF.h
//  SmartingPark
//
//  Created by BigShow1949 on 15/7/24.
//  Copyright (c) 2015年 BigShow1949. All rights reserved.
//

#import "MBProgressHUD.h"
//#import "YFRefreshButton.h"

#import <UIKit/UIKit.h>

@interface MBProgressHUD (YF)


 // 黑框白字 转菊花 默认没有背景遮盖
+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

 // 上面图片 下面文字 可自定义图片 闪现提示
+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (void)show:(NSString *)message icon:(NSString *)icon;
+ (void)show:(NSString *)message icon:(NSString *)icon view:(UIView *)view;

// 隐藏hud创建的
+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;


// 黑框白字  闪现提示 根据文字调整  不是hud 创建// 先不考虑多行文字
+ (void)tipView:(NSString *)message;
+ (void)tipView:(NSString *)message toView:(UIView *)view;


/*----------------无数据页面提示---------------------*/
// 无数据界面提示 imageName跟title如果为nil 就是用默认的图片跟文字
+ (void)noDataTipView:(UIView *)view;
+ (void)noDataTipView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName;
+ (void)noDataTipView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName refresh:(void (^)())reload;
+ (void)noDataTipView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName refresh:(SEL)action addTarget:(nullable id)target;


/*----------------无网络页面提示---------------------*/
+ (void)networkErrorTipView:(UIView *)view refresh:(void (^)())reload;
+ (void)networkErrorTipView:(UIView *)view refresh:(SEL)action addTarget:(nullable id)target;
+ (void)networkErrorTipView:(UIView *)view title:(NSString *)title message:(NSString *)message refresh:(SEL)action addTarget:(nullable id)target;
+ (void)networkErrorTipView:(UIView *)view title:(NSString *)title message:(NSString *)message refreshButtonClick:(void (^)())reload;



@end





