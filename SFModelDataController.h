//
//  SFStudentModelDataSource.h
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/14/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeFellowModel.h"

@interface SFModelDataController : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *studentsArray;
@property (strong, nonatomic) NSMutableArray *teachersArray;

- (void)populatePersonData;
//- (void)saveCodeFellowsList;

@end
