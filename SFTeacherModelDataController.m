//
//  SFTeacherModelDataController.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/14/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFTeacherModelDataController.h"
#import "TeacherModel.h"

@implementation SFTeacherModelDataController

+ (NSMutableArray *)populateTeacherData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"];
    NSMutableArray *originalData = [NSMutableArray arrayWithContentsOfFile:path];
    
    NSMutableArray *classArray = [NSMutableArray new];
    
    for (NSDictionary *dict in originalData)
    {        
        if ([dict[@"student"]  isEqual:@FALSE]) {
            
            TeacherModel *model = [TeacherModel new];
            NSString *fullName = dict[@"name"];
            
            NSArray *stringComponents = [fullName componentsSeparatedByString:@" "];
            model.teacherFirstName = stringComponents[0];
            model.teacherLastName = stringComponents[1];
            
            model.teacherTwitter = dict[@"twitter"];
            model.teacherGithub = dict[@"github"];
            
            [classArray addObject:model];
            
        }
    }
    
    return classArray;
}

@end