//
//  MBProgressHUD+YF.m
//  SmartingPark
//
//  Created by BigShow1949 on 15/7/24.
//  Copyright (c) 2015年 BigShow1949. All rights reserved.
//

//#import "MBProgressHUD.h"
//@interface MBProgressHUD (YF)
//@property (nonatomic, strong, readwrite) id myCustomProperty;
//@end

#import "MBProgressHUD+YF.h"
//#import "YFRefreshButton.h"
#import <objc/runtime.h>

#define YFScreen [UIScreen mainScreen].bounds.size

#define kWarningImgLenght 100
#define kWarningLabelW 320
#define kWarningLabelH 100
#define kSpace 20

@interface YFRefreshButton : UIButton

@property (nonatomic, copy) void (^clickWithBlock)();
@property (nonatomic,assign) SEL action;
@property (nonatomic,strong) id target;

@end

@implementation YFRefreshButton

@end

@interface MBProgressHUD (YF)
@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) YFRefreshButton *refreshButton;

@end

@implementation MBProgressHUD (YF)

static UIView *hudKey = (UIView *)@"hudKey";
static UIView *bgViewKey = (UIView *)@"bgViewKey";
static YFRefreshButton *refreshButtonKey = (YFRefreshButton *)@"refreshButtonKey";

- (id)bgView
{
    return objc_getAssociatedObject(self, &bgViewKey);
}

- (void)setBgView:(UIView *)bgView
{
    objc_setAssociatedObject(self, &bgViewKey, bgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)hud
{
    return objc_getAssociatedObject(self, &hudKey);
}

- (void)setHud:(UIView *)hud
{
    objc_setAssociatedObject(self, &hudKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



- (YFRefreshButton *)refreshButton
{
    return objc_getAssociatedObject(self, &refreshButtonKey);
}

- (void)setRefreshButton:(YFRefreshButton *)refreshButton
{
    objc_setAssociatedObject(self, &refreshButtonKey, refreshButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}




#pragma mark 黑框白字 转菊花 默认没有背景遮盖
+ (MBProgressHUD *)showMessage:(NSString *)message {
    return [self showMessage:message toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.labelText = message;
    //    hud.color = [UIColor redColor];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.alpha = 0.5;
    // YES代表需要蒙版效果
    //    hud.dimBackground = YES;
    return hud;
}

#pragma mark - 黑框白字  闪现提示 根据文字调整
+ (void)tipView:(NSString *)message {   
    
    [self tipView:message toView:nil ];
}

+ (void)tipView:(NSString *)message toView:(UIView *)view {
    
    UILabel *label = [[UILabel alloc]init];
    label.text = message;
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    CGSize labelMaxSize = CGSizeMake(200, 100);
    CGSize labelSize = [self sizeWithText:label.text andFont:label.font andMaxSize:labelMaxSize];;
    label.frame = CGRectMake(0, 0, 250, 40); // 上下各10空隙
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    UIView *showView =  [[UIView alloc]init];
    showView.backgroundColor = [UIColor blackColor];
    CGFloat showViewH = labelSize.height > 40 ? labelSize.height : 40;
    showView.frame = CGRectMake(0, 0, 260, 40);  // 上下的间隙
    showView.center = CGPointMake(YFScreen.width /2, YFScreen.height/2);
    showView.alpha = 1.0f;
    showView.layer.cornerRadius = 10.0f;
    showView.layer.masksToBounds = YES;
    [view addSubview:showView];
    [showView addSubview:label];
    
    
    [UIView animateWithDuration:3 animations:^{  // 1.5
        showView.alpha = 0;
    } completion:^(BOOL finished) {
        [showView removeFromSuperview];
    }];

}

#pragma mark - 上面图片 下面文字 可自定义图片 闪现提示
+ (void)showError:(NSString *)error toView:(UIView *)view { // 默认 图片 自己更换
    [self show:error icon:@"iconfont-shunfengche" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self show:success icon:@"megaphone" view:view];
}

+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error {
    [self showError:error toView:nil];
}

+ (void)show:(NSString *)message icon:(NSString *)icon {

    [self show:message icon:icon view:nil];
}

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    hud.labelColor = [UIColor blackColor];
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];

    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    hud.color = [UIColor whiteColor];
    
    // 0.7秒之后再消失
    [hud hide:YES afterDelay:0.7];  // 0.7
}



#pragma mark -  隐藏hud创建的
+ (void)hideHUDForView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD {

    [self hideHUDForView:nil];
}


#pragma mark - 无数据界面提示
+ (void)noDataTipView:(UIView *)view {  // 默认 文字/图片 自己更换
    [self noDataTipView:view title:@"您还没有相关记录..." imageName:@"tinche_jilu"];
}

+ (void)noDataTipView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName {
    [self noDataTipView:view title:title imageName:imageName refresh:nil addTarget:nil];
}

+ (void)noDataTipView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName refresh:(void (^)())reload {
    [self noDataTipView:view title:title imageName:imageName block:reload action:nil addTarget:nil];
}

+ (void)noDataTipView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName refresh:(SEL)action addTarget:(nullable id)target {
    [self noDataTipView:view title:title imageName:imageName block:nil action:action addTarget:target];
}

+ (void)noDataTipView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName  block:(void (^)())reload action:(SEL)action addTarget:(nullable id)target {
    [self tipView:view title:title message:nil imageName:imageName block:reload action:action addTarget:target];
}


#pragma mark - 无网络页面提示 默认图片
+ (void)networkErrorTipView:(UIView *)view refresh:(void (^)())reload {  // 默认文字自己更换
    [self networkErrorTipView:view title:@"加载失败!" message:@"请检查您的网络是否正常" refreshButtonClick:reload];
}

+ (void)networkErrorTipView:(UIView *)view refresh:(SEL)action addTarget:(nullable id)target {
    [self networkErrorTipView:view title:@"加载失败!" message:@"请检查您的网络是否正常" refresh:action addTarget:target];
}

+ (void)networkErrorTipView:(UIView *)view title:(NSString *)title message:(NSString *)message refreshButtonClick:(void (^)())reload {
    
    [self networkErrorTipView:view title:title message:message block:reload action:nil addTarget:nil];
}

+ (void)networkErrorTipView:(UIView *)view title:(NSString *)title message:(NSString *)message refresh:(SEL)action addTarget:(nullable id)target {
    [self networkErrorTipView:view title:title message:message block:nil action:action addTarget:target];
}

+ (void)networkErrorTipView:(UIView *)view title:(NSString *)title message:(NSString *)message block:(void (^)())reload action:(SEL)action addTarget:(nullable id)target {  // 默认图片自己更换
    [self tipView:view title:title message:message imageName:@"jiazaishibai" block:reload action:action addTarget:target];
}

#pragma mark - 内部公共方法
+ (void)refreshBtnClick:(YFRefreshButton *)btn{
    
    if (btn.clickWithBlock) {
        btn.clickWithBlock();
        
    }else {
        [btn.target performSelector:btn.action withObject:nil];
    }
}

- (void)refreshBtnClick:(YFRefreshButton *)btn{
    
    if (btn.clickWithBlock) {
        btn.clickWithBlock();
        
    }else {
        // 回调前将自己移除
        [self.bgView removeFromSuperview];
        [btn.target performSelector:btn.action withObject:nil];
    }
}


// 程序到这里 title 跟 imageName 都应该有值 message可能没有值
+ (void)tipView:(UIView *)view title:(NSString *)title message:(NSString *)message imageName:(NSString *)imageName block:(void (^)())reload action:(SEL)action addTarget:(nullable id)target {

    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    [hud tipView:view title:title message:message imageName:imageName block:reload action:action addTarget:target hud:hud];

}

- (void)tipView:(UIView *)view title:(NSString *)title message:(NSString *)message imageName:(NSString *)imageName block:(void (^)())reload action:(SEL)action addTarget:(nullable id)target hud:(MBProgressHUD *)hud{

    self.hud = hud;
    CGFloat padding = 10;
    
    // 大的背景view
    CGRect bgViewFrame = CGRectMake(0, 0, YFScreen.width, YFScreen.height);
    UIView *bgView = [[UIView alloc] initWithFrame:bgViewFrame];
    self.bgView = bgView;
    bgView.backgroundColor = view.backgroundColor;
    [view addSubview:bgView];
    [view bringSubviewToFront:bgView];
    
    // 图片
    CGFloat imgWH = 100;
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake((bgViewFrame.size.width-imgWH)/2, (bgView.frame.size.height-imgWH)/2 - (kWarningLabelH + kSpace)/2, imgWH, imgWH)];
    imageView.image = [UIImage imageNamed:imageName];
    [bgView addSubview:imageView];
    
    // title
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    CGSize titleMaxSize = CGSizeMake(bgViewFrame.size.width, MAXFLOAT);
    CGSize titleSize = [self sizeWithText:title andFont:titleLabel.font andMaxSize:titleMaxSize];
    CGFloat titleX = (bgViewFrame.size.width - titleSize.width) * 0.5;
    CGFloat titleY = CGRectGetMaxY(imageView.frame) + padding;
    titleLabel.frame = CGRectMake(titleX, titleY, titleSize.width, titleSize.height);
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    titleLabel.text = title;
    [bgView addSubview:titleLabel];
    
    // msg
    UILabel *msgLabel = [[UILabel alloc] init];
    if (message) {
        CGSize msgMaxSize = CGSizeMake(bgViewFrame.size.width, MAXFLOAT);
        msgLabel.font = [UIFont systemFontOfSize:12];
        CGSize msgSize = [self sizeWithText:message andFont:msgLabel.font andMaxSize:msgMaxSize];
        CGFloat msgX = (bgViewFrame.size.width - msgSize.width) * 0.5;
        CGFloat msgY = CGRectGetMaxY(titleLabel.frame) + padding;
        msgLabel.frame = CGRectMake(msgX, msgY, msgSize.width, msgSize.height);
        [msgLabel setTextAlignment:NSTextAlignmentCenter];
        msgLabel.text = message;
        [bgView addSubview:msgLabel];
    }
    
    
    // 刷新按钮
    if (reload || action) {
        CGFloat refreshBtnW = 60;
        CGFloat refreshBtnH = 30;
        CGFloat refreshBtnX = (bgViewFrame.size.width - refreshBtnW) * 0.5;
        CGFloat refreshBtnY;
        if (message) {
            refreshBtnY = CGRectGetMaxY(msgLabel.frame) + padding * 2;
        }else {
            refreshBtnY = CGRectGetMaxY(titleLabel.frame) + padding * 2;
        }
        YFRefreshButton *refreshBtn = [[YFRefreshButton alloc] init];
        self.refreshButton = refreshBtn;
        refreshBtn.frame = CGRectMake(refreshBtnX, refreshBtnY, refreshBtnW, refreshBtnH);
        [refreshBtn setTitle:@"刷新" forState:UIControlStateNormal];
        [refreshBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        refreshBtn.layer.borderWidth = 0.5;
        refreshBtn.layer.borderColor = refreshBtn.titleLabel.textColor.CGColor;
        refreshBtn.layer.cornerRadius = 5;
        refreshBtn.layer.masksToBounds = YES;
        refreshBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [bgView addSubview:refreshBtn];
        refreshBtn.clickWithBlock = reload;
        refreshBtn.action = action;
        refreshBtn.target = target;
        [refreshBtn addTarget:self action:@selector(refreshBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }

}


#pragma mark - 计算控件大小
+ (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize {
    
    NSDictionary *atts = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:atts context:nil].size;
}

- (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize {
    
    NSDictionary *atts = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:atts context:nil].size;
}




@end
