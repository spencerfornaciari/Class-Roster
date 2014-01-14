//
//  SFStudentModelDataSource.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/14/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFStudentModelDataController.h"
#import "StudentModel.h"
#import "TeacherModel.h"

@implementation SFStudentModelDataController

+ (NSMutableArray *)populateStudentData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"];
    NSMutableArray *originalData = [NSMutableArray arrayWithContentsOfFile:path];
    
    NSMutableArray *classArray = [NSMutableArray new];
    
    for (NSDictionary *dict in originalData)
    {
            if ([dict[@"student"]  isEqual: @TRUE]) {
                
                StudentModel *model = [StudentModel new];
                NSString *fullName = dict[@"name"];
                
                NSArray *stringComponents = [fullName componentsSeparatedByString:@" "];
                model.studentFirstName = stringComponents[0];
                model.studentLastName = stringComponents[1];

                model.studentName = dict[@"name"];
                model.studentTwitter = dict[@"twitter"];
                model.studentGithub = dict[@"github"];
                
                [classArray addObject:model];
            }
    }
    
    return classArray;
}

@end