//
//  SFStudentModelDataSource.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/14/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFModelDataController.h"
#import "StudentModel.h"
#import "TeacherModel.h"

@implementation SFModelDataController

- (void)populateStudentData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"];
    NSMutableArray *originalData = [NSMutableArray arrayWithContentsOfFile:path];
    
    _studentsArray = [NSMutableArray new];
    
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
                
                [_studentsArray addObject:model];
            }
    }
}

- (void)populateTeacherData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"];
    NSMutableArray *originalData = [NSMutableArray arrayWithContentsOfFile:path];
    
    _teachersArray = [NSMutableArray new];
    
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
            
            [_teachersArray addObject:model];
            
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle;
    
    switch (section) {
        case 0:
            sectionTitle = @"Students";
            return sectionTitle;
            break;
            
        case 1:
            sectionTitle = @"Instructors";
            return sectionTitle;
            break;
            
        default:
            break;
    }
    
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return _studentsArray.count;
    }
    
    if (section == 1) {
        return _teachersArray.count;
    }
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [[_studentsArray objectAtIndex:indexPath.row] studentFirstName], [[_studentsArray objectAtIndex:indexPath.row] studentLastName]];
            
            return cell;
            break;
            
        case 1:
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [[_teachersArray objectAtIndex:indexPath.row] teacherFirstName], [[_teachersArray objectAtIndex:indexPath.row] teacherLastName]];
            
            return cell;
            break;
            
        default:
            break;
    }
    
    return nil;
}

@end