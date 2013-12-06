//
//  XYZDailyPracticeViewController.h
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/1/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZDailyPracticeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *scheduledTime;
- (IBAction)setActionClicked:(id)sender;

@end
