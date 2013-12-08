//
//  XYZSkillViewController.m
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/1/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import "XYZSkillViewController.h"

@interface XYZSkillViewController ()

@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *exerciseLabel;

@end


@implementation XYZSkillViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set information based on skill's dictionary
    self.navigationItem.title = [self.viewData.skillDetails objectForKey:@"Title"];
    self.descriptionLabel.text = [self.viewData.skillDetails objectForKey:@"Description"];
    self.exerciseLabel.text = [self.viewData.skillDetails objectForKey:@"Exercise"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
