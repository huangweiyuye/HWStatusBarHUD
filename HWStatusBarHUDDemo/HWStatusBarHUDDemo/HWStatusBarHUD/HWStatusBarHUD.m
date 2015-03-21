//
//  HWStatusBarHUD.m
//  01-网易新闻客户端
//
//  Created by 黄伟 on 15/3/20.
//  Copyright (c) 2015年 atguigu. All rights reserved.
//

#import "HWStatusBarHUD.h"

#define HWWindowHeight 20

#define HWDuration 0.8
#define HWDelay 1.0

@implementation HWStatusBarHUD

UIWindow *_window;

+ (void)showMessage:(NSString *)msg image:(UIImage *)image{
    
    if (_window) return;
    
    //创建一个窗口
    _window=[[UIWindow alloc] init];
    _window.windowLevel=UIWindowLevelAlert;
    
    _window.backgroundColor=[UIColor blackColor];
    
    _window.frame=CGRectMake(0, -HWWindowHeight, [UIScreen mainScreen].bounds.size.width, HWWindowHeight);
    
    //建立button
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font=[UIFont systemFontOfSize:12];
    button.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    [button setTitle:msg forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    button.frame=_window.bounds;
    [_window addSubview:button];
    _window.hidden=NO;
    
    //通过动画
    [UIView animateWithDuration:HWDuration animations:^{
        CGRect frame=_window.frame;
        frame.origin.y=0;
        _window.frame=frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:HWDuration delay:HWDelay options:0 animations:^{
            CGRect frame=_window.frame;
            frame.origin.y=-HWWindowHeight;
            _window.frame=frame;
        } completion:^(BOOL finished) {
            _window=nil;
        }];
    }];
}

+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName{
    return [self showMessage:msg image:[UIImage imageNamed:imageName]];
}

+ (void)showSuccess:(NSString *)msg{
    return [self showMessage:msg imageName:@"HWStatusBarHUD.bundle/success"];
}

+ (void)showError:(NSString *)msg{
    return [self showMessage:msg imageName:@"HWStatusBarHUD.bundle/error"];
}

+ (void)showLoading:(NSString *)msg{
    if (_window) return;
    //创建一个窗口
    _window=[[UIWindow alloc] init];
    _window.windowLevel=UIWindowLevelAlert;
    
    _window.backgroundColor=[UIColor blackColor];
    
    _window.frame=CGRectMake(0, -HWWindowHeight, [UIScreen mainScreen].bounds.size.width, HWWindowHeight);
    
    //建立button
    UIActivityIndicatorView *indicatorView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicatorView startAnimating];
    indicatorView.frame=CGRectMake(0, 0, HWWindowHeight, HWWindowHeight);
    [_window addSubview:indicatorView];
    
    UILabel *label=[[UILabel alloc] init];
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:12];
    label.text=msg;
    label.textAlignment=NSTextAlignmentCenter;
    label.frame=_window.bounds;
    [_window addSubview:label];
    
    _window.hidden=NO;
    
    //通过动画
    [UIView animateWithDuration:HWDuration animations:^{
        CGRect frame=_window.frame;
        frame.origin.y=0;
        _window.frame=frame;
    } completion:nil];
}

+ (void)hideLoading{
    //通过动画
    [UIView animateWithDuration:HWDuration animations:^{
        CGRect frame=_window.frame;
        frame.origin.y=-HWWindowHeight;
        _window.frame=frame;
    } completion:^(BOOL finished) {
        _window=nil;
    }];
}

@end
