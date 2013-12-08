//
//  XYZModuleViewController.m
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/5/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import "XYZModuleViewController.h"
#import "XYZSkill.h"
#import "XYZSkillViewController.h"
#import "XYZSkillDetail.h"

@interface XYZModuleViewController ()

@end


@implementation XYZModuleViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set title to name of module
    self.navigationItem.title = self.moduleNameString;
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
    // count number of skills in module for number of rows
    return [self.skillData.moduleSkillsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SkillPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // format cell with skill titles
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.skillData.moduleSkillsArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Navigation

// pass data to next view, SkillView, during push segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        XYZSkillViewController *nextViewController = [segue destinationViewController];
        
        // pull skill details with module key and skill's index
        XYZSkillDetail *skillDetail = [[XYZSkillDetail alloc]initWithKey:self.moduleNameString andIndex:indexPath.row];
        
        // pass on SkillDetail object
        nextViewController.viewData = skillDetail;
    }
}

@end
