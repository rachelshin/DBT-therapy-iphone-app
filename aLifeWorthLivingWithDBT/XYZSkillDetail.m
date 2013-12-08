//
//  XYZSkillDetail.m
//  aLifeWorthLivingWithDBT
//
//  Created by Rachel Shin on 12/7/13.
//  Copyright (c) 2013 Rachel Shin. All rights reserved.
//

#import "XYZSkillDetail.h"

@implementation XYZSkillDetail

- (id) initWithKey:(NSString *)key andIndex:(NSUInteger*)index{
    
    // pulled from https://developer.apple.com/library/mac/documentation/cocoa/conceptual/PropertyLists/QuickStartPlist/QuickStartPlist.html
    self = [super init];
    if (self) {
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
        NSDictionary *tempDict = (NSDictionary *)[NSPropertyListSerialization
                                                  propertyListFromData:plistXML
                                                  mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                  format:&format
                                                  errorDescription:&errorDesc];
        if (!tempDict) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
        
        // create array of dictionaries from key
        NSArray *dictArray = [[NSArray alloc] init];
        dictArray = [tempDict objectForKey:key];
        
        // index into correct dictionary, create dictionary for it
        self.skillDetails = [[NSDictionary alloc]init];
        self.skillDetails = [dictArray objectAtIndex:index];
    }
    return self;
}

@end
