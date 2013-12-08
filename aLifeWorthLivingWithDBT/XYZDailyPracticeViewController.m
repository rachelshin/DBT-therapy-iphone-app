//
//  XYZDailyPracticeViewController.m
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/1/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import "XYZDailyPracticeViewController.h"


@interface XYZDailyPracticeViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *setButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *scheduledTime;
@property (weak, nonatomic) IBOutlet UIButton *noReminderButton;

@end



@implementation XYZDailyPracticeViewController

// things to do when Set button or No Reminder button is pressed
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == self.setButton) {
        // pull time from datePicker
        NSDate *time = [self.scheduledTime date];
        
        // create local notification
        self.reminder = [[UILocalNotification alloc] init];
        if (self.reminder == nil)
        {
            return;
        }
        
        // configure local notification
        self.reminder.fireDate = time;
        self.reminder.alertAction = @"Okay";
        self.reminder.repeatInterval = NSDayCalendarUnit;
        [[UIApplication sharedApplication] scheduleLocalNotification:self.reminder];
    }
    
    // cancel notification if this button is pressed
    else if (sender == self.noReminderButton){
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
    else {
        return;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
