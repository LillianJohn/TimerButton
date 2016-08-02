//
//  ViewController.m
//  Test_NSTimer
//
//  Created by Lillian on 16/8/1.
//  Copyright © 2016年 Lillian. All rights reserved.
//

#import "ViewController.h"
#import "LYQ_CustomButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    创建按钮
    LYQ_CustomButton *btn = [[LYQ_CustomButton alloc]initWithFrame:CGRectMake(100, 200, 100, 30)];
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = .3;
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [self.view addSubview:btn];
   [btn countDownButtonHandler:^(LYQ_CustomButton *countDownButton, NSInteger tag) {
       btn.enabled = NO;
       [btn startCountDownWithSecond:60];
       [btn countDownChanging:^NSString *(LYQ_CustomButton *countDownButton, NSInteger time) {
           NSString *title = [NSString stringWithFormat:@"剩余%zds",time];
           return title;
       }];
       [btn countDownFinished:^NSString *(LYQ_CustomButton *countDownButton, NSInteger time) {
           countDownButton.enabled = YES;
           return @"点击重新获取";
       }];
   }];
    
}
@end
