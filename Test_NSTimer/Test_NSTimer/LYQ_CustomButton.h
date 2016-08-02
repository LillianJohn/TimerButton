//
//  LYQ_CustomButton.h
//  Test_NSTimer
//
//  Created by Lillian on 16/8/1.
//  Copyright © 2016年 Lillian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  LYQ_CustomButton;

typedef NSString *(^CountDownChanging)(LYQ_CustomButton *countDownButton,NSInteger time);
typedef NSString *(^CountDownFinished)(LYQ_CustomButton *countDownButton,NSInteger time);
typedef void (^TouchCountDownButtonHandler)(LYQ_CustomButton *countDownButton,NSInteger tag);

@interface LYQ_CustomButton : UIButton
{
    NSInteger   _time;
    NSUInteger  _totalTime;
    NSTimer     *_timer;
    NSDate      *_startDate;
    
    CountDownChanging   _countDownChanging;
    CountDownFinished   _countDownFinish;
    TouchCountDownButtonHandler _touchedCounDownBtn;
}
@property   (nonatomic,strong)id userInfo;
- (void)countDownButtonHandler:(TouchCountDownButtonHandler)touchedCountDownButtonHandler;
- (void)countDownChanging:(CountDownChanging)countDownChanging;
- (void)countDownFinished:(CountDownFinished)countDownFinished;

-(void)startCountDownWithSecond:(NSUInteger)second;
-(void)stopCountDown;
@end
