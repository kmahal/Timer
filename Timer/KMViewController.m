//
//  KMViewController.m
//  Timer
//
//  Created by Kabir Mahal on 9/20/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import "KMViewController.h"

@interface KMViewController ()
{
    NSTimer *timerTimer;
    NSDate *timerDate;
    NSDate *startDate;
    NSTimeInterval secondsFromStart;
    int count;
}

@end

@implementation KMViewController

@synthesize timePicker, timerLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    timePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    timerLabel.text = @"";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeTimer{

    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:startDate];
    
    timeInterval += secondsFromStart;
    
    timeInterval = timePicker.countDownDuration - timeInterval;
    
    timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    NSString *dateString = [dateFormatter stringFromDate:timerDate];
    timerLabel.text = dateString;
    
    dateFormatter = nil;
    
}

- (IBAction)startTimer:(id)sender {
    
    if (count == 0){
        timePicker.hidden = YES;
        timerLabel.text = [NSString stringWithFormat:@"%f", timePicker.countDownDuration];
    }

    timerTimer = [NSTimer scheduledTimerWithTimeInterval:1/10
                                                  target:self
                                                selector:@selector(changeTimer)
                                                userInfo:nil
                                                 repeats:YES];
    startDate = [[NSDate alloc] init];
    [timerTimer fire];
    
}

- (IBAction)pauseTimer:(id)sender {
    [timerTimer invalidate];
    timerTimer = nil;
    
    [self changeTimer];
    
    secondsFromStart += [[NSDate date] timeIntervalSinceDate:startDate];
    
    
}

- (IBAction)stopTimer:(id)sender {
    timerLabel.text = @"";
    timePicker.hidden = NO;
    
    [timerTimer invalidate];
    timerTimer = nil;
}
@end
