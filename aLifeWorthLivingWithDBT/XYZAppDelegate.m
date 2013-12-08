//
//  XYZAppDelegate.m
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/1/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import "XYZAppDelegate.h"

@implementation XYZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// presents alert message from local notification reminder
- (void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    // create array of module names
    self.modules = [[NSArray alloc]initWithObjects:cmString, erString, dtString, ieString, nil];
    
    // choose a random module
    NSInteger random = arc4random() % [self.modules count];
    NSString *key = [self.modules objectAtIndex:random];
    
    // pulled from https://developer.apple.com/library/mac/documentation/cocoa/conceptual/PropertyLists/QuickStartPlist/QuickStartPlist.html
    
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:@"SkillProperties.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"SkillProperties" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *tempDict = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    if (!tempDict) {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
    
    // create array of dictionaries from key, which is a random module
    NSArray *dictArray = [[NSArray alloc] init];
    dictArray = [tempDict objectForKey:key];

    // get random number for index of one skill
    NSInteger skillRandom = arc4random() % [dictArray count];

    // index into correct dictionary
    NSDictionary *skillInfo = [[NSDictionary alloc]init];
    skillInfo = [dictArray objectAtIndex:skillRandom];

    // pull title and exercise from skill
    NSString *title = [skillInfo objectForKey:@"Title"];
    NSString *body = [skillInfo objectForKey:@"Exercise"];


    // create alert and show
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:body delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alertView show];
}

@end
