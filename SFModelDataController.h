//
//  SFStudentModelDataSource.h
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/14/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFModelDataController : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *studentsArray;
@property (strong, nonatomic) NSMutableArray *teachersArray;

- (void)populateStudentData;
- (void)populateTeacherData;


@end
