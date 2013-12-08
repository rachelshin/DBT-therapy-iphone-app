//
//  XYZMainViewController.m
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/1/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import "XYZMainViewController.h"
#import "XYZModuleViewController.h"
#import "XYZSkill.h"

// module names, global variables
NSString *cmString = @"Core Mindfulness";
NSString *erString = @"Emotion Regulation";
NSString *dtString = @"Distress Tolerance";
NSString *ieString = @"Interpersonal Effectiveness";


@interface XYZMainViewController ()

@property XYZSkill *skill;

@end



@implementation XYZMainViewController

// called by DailyPracticeView(Controller) to navigate back to Main
- (IBAction)unwindToMain:(UIStoryboardSegue *)segue
{
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // create array of module names
    self.moduleNames = [[NSArray alloc]initWithObjects:cmString, erString, dtString, ieString, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
    return 1;
 }

 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
    // one row for each module
    return self.moduleNames.count;
 }

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     // link identifier from storyboard
     static NSString *CellIdentifier = @"ModulePrototypeCell";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
     // format cell with corresponding module name
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     cell.textLabel.text = [self.moduleNames objectAtIndex:indexPath.row];
    
     return cell;
}

#pragma mark - Navigation

// pass data to moduleViewController during push segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showSkills"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        // find module name that was selected
        NSString *module = [self.moduleNames objectAtIndex:indexPath.row];
        
        // retrieve module's array of dictionaries and put in Skill object
        XYZSkill *skill = [[XYZSkill alloc]initWithKey:module];
        XYZModuleViewController *nextViewController = [segue destinationViewController];
        
        // pass on name of module and module's data
        nextViewController.moduleNameString = module;
        nextViewController.skillData = skill;
    }
}

@end
