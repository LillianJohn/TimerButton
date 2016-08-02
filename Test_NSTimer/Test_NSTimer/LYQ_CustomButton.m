//
//  LYQ_CustomButton.m
//  Test_NSTimer
//
//  Created by Lillian on 16/8/1.
//  Copyright © 2016年 Lillian. All rights reserved.
//

#import "LYQ_CustomButton.h"

@implementation LYQ_CustomButton

#pragma -mark touche action
-(void)countDownButtonHandler:(TouchCountDownButtonHandler)touchedCountDownButtonHandler{
    _touchedCounDownBtn = [touchedCountDownButtonHandler copy];
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)touched:(LYQ_CustomButton *)sender{
    if (_touchedCounDownBtn) {
        _touchedCounDownBtn(sender,sender.tag);
    }
}

#pragma -mark count down method
-(void)startCountDownWithSecond:(NSUInteger)totalSecond
{
    _totalTime = totalSecond;// totalSecond = 10
    _time = totalSecond;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    _startDate = [NSDate date];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
-(void)timerStart:(NSTimer *)theTimer {
    double deltaTime = [[NSDate date] timeIntervalSinceDate:_startDate];
    
    _time = _totalTime - (NSInteger)(deltaTime+0.5) ;
    
    
    if (_time< 0.0)
    {
        [self stopCountDown];
    }
    else
    {
        if (_countDownChanging)
        {
            [self setTitle:_countDownChanging(self,_time) forState:UIControlStateNormal];
            [self setTitle:_countDownChanging(self,_time) forState:UIControlStateDisabled];
            
        }
        else
        {
            NSString *title = [NSString stringWithFormat:@"%zds",_time];
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitle:title forState:UIControlStateDisabled];
            
        }
    }
}

- (void)stopCountDown{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                _time = _totalTime;
                if (_countDownFinish)
                {
                    [self setTitle:_countDownFinish(self,_totalTime)forState:UIControlStateNormal];
                    [self setTitle:_countDownFinish(self,_totalTime)forState:UIControlStateDisabled];
                    
                }
                else
                {
                    [self setTitle:@"重新获取" forState:UIControlStateNormal];
                    [self setTitle:@"重新获取" forState:UIControlStateDisabled];
                    
                }
            }
        }
    }
}
#pragma -mark block
-(void)countDownChanging:(CountDownChanging)countDownChanging{
    _countDownChanging = [countDownChanging copy];
}
-(void)countDownFinished:(CountDownFinished)countDownFinished{
    _countDownFinish = [countDownFinished copy];
}
@end
