//
//  XYZSkillDetail.h
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/7/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZSkillDetail : NSObject

// dictionary with details about one skill
@property (copy, nonatomic) NSDictionary *skillDetails;

- (id) initWithKey:(NSString *)key andIndex:(NSInteger *)index;

@end
