//
//  XYZSkill.h
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/5/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZSkill : NSObject{
    NSString *title;
    NSString *description;
    NSString *exercise;
}

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *description;
@property (copy, nonatomic) NSString *exercise;

@end
