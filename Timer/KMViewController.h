//
//  KMViewController.h
//  Timer
//
//  Created by Kabir Mahal on 9/20/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

- (IBAction)startTimer:(id)sender;
- (IBAction)pauseTimer:(id)sender;
- (IBAction)stopTimer:(id)sender;
-(void)changeTimer;


@end
