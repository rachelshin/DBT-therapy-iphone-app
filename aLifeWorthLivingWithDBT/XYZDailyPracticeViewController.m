//
//  XYZDailyPracticeViewController.m
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/1/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import "XYZDailyPracticeViewController.h"


@interface XYZDailyPracticeViewController ()

// button to set time for reminder notifications
@property (weak, nonatomic) IBOutlet UIBarButtonItem *setButton;

@end

@implementation XYZDailyPracticeViewController

- (void) setActionClicked:(id)sender {
    
    // pull time from datepicker
    NSDate *time = [self.scheduledTime date];
    
    // create notification
    UILocalNotification* reminder = [[UILocalNotification alloc] init];
    if (reminder == nil)
    {
        return;
    }
    reminder.fireDate = time;
    
    // random module
//    NSUInteger moduleIndex = arc4random() % 4;
//
//    // random skill in module
//    NSUInteger skillIndex = arc4random() %  // number of items in module array
    

    // pull skill title and exercise for title and body
    
    // title
    reminder.alertAction = @"Test Title";
    
    // body message
    reminder.alertBody = @"Alert Message";
    
    reminder.repeatInterval = NSDayCalendarUnit;
    [[UIApplication sharedApplication] scheduleLocalNotification:reminder];
    
    // exit to original storyboard
//    [self.navigationController popViewControllerAnimated:YES];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
