//
//  XYZSkill.h
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/5/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZSkill : NSObject

// array of all skills within one module
@property (strong, nonatomic) NSMutableArray *moduleSkillsArray;

- (id) initWithKey:(NSString *) key;

@end
