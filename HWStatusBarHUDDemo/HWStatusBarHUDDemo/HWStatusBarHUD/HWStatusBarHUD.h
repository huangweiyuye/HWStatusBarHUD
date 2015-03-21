//
//  HWStatusBarHUD.h
//  01-网易新闻客户端
//
//  Created by 黄伟 on 15/3/20.
//  Copyright (c) 2015年 atguigu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWStatusBarHUD : NSObject
/**
 *  增加的一个新方法来测试
 *
 *  @param msg 信息
 */
+ (void)showAllMsg:(NSString *)msg;

/**
 *  显示图片及图片
 *
 *  @param msg   信息
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示信息及图片名称
 *
 *  @param msg       信息
 *  @param imageName 图片名称
 */
+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName;

/**
 *  显示成功消息
 *
 *  @param msg 消息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示失败消息
 *
 *  @param msg 消息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示加载信息
 *
 *  @param msg 信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏加载信息
 */
+ (void)hideLoading;

@end
