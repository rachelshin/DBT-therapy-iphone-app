//
//  XYZModuleViewController.h
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/5/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZSkill.h"


@interface XYZModuleViewController : UITableViewController

// skills associated with the selected module
@property XYZSkill *skillData;

@property NSString *moduleNameString;

@end
