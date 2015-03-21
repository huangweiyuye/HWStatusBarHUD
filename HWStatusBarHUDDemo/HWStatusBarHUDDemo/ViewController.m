//
//  ViewController.m
//  HWStatusBarHUDDemo
//
//  Created by 黄伟 on 15/3/21.
//  Copyright (c) 2015年 atguigu. All rights reserved.
//

#import "ViewController.h"
#import "HWStatusBarHUD.h"

@interface ViewController ()
- (IBAction)showSuccessMsg:(id)sender;


- (IBAction)showErrorMsg:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSuccessMsg:(id)sender {
    [HWStatusBarHUD showSuccess:@"显示成功信息..."];
}

- (IBAction)showErrorMsg:(id)sender {
    [HWStatusBarHUD showError:@"显示失败信息..."];
}
@end
