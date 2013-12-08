//
//  XYZAppDelegate.h
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/1/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *cmString;
extern NSString *erString;
extern NSString *dtString;
extern NSString *ieString;


@interface XYZAppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSArray *modules;


@end
