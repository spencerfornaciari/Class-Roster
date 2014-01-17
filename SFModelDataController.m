//
//  SFStudentModelDataSource.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/14/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFModelDataController.h"

@implementation SFModelDataController


- (void)populatePersonData
{
    _studentsArray = [NSMutableArray new];
    _teachersArray = [NSMutableArray new];
    
    NSArray *originalData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"]];
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSString *codeFellowsPath = [documentsURL path];
    
    //NSLog(@"%@", originalData);
   // codeFellowsPath = [codeFellowsPath stringByAppendingPathComponent:@"Bootcamp.plist"];
    
    //[saveCodeFellows writeToFile:codeFellowsPath atomically:YES];
    
    //NSMutableArray *originalData = [NSMutableArray arrayWithContentsOfFile:codeFellowsPath];
    
    for (NSDictionary *dict in originalData)
    {
        if ([dict[@"student"]  isEqual: @TRUE]) {
            
            CodeFellowModel *model = [CodeFellowModel new];
            NSString *fullName = dict[@"name"];
            
            NSArray *stringComponents = [fullName componentsSeparatedByString:@" "];
            model.firstName = stringComponents[0];
            model.lastName = stringComponents[1];
            
            model.fullName = dict[@"name"];
            model.twitter = dict[@"twitter"];
            model.github = dict[@"github"];
            model.isStudent = TRUE;
            
            [_studentsArray addObject:model];
            
        }
        else {
            
            CodeFellowModel *model = [CodeFellowModel new];
            NSString *fullName = dict[@"name"];
            
            NSArray *stringComponents = [fullName componentsSeparatedByString:@" "];
            model.firstName = stringComponents[0];
            model.lastName = stringComponents[1];
            
            model.fullName = dict[@"name"];
            model.twitter = dict[@"twitter"];
            model.github = dict[@"github"];
            model.isStudent = FALSE;

            [_teachersArray addObject:model];
        }
    }
    
    NSLog(@"%@", _studentsArray);
    
    NSString *studentPath = [codeFellowsPath stringByAppendingPathComponent:@"students"];
                             
    NSLog(@"%@", studentPath);
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *dirContents = [fm contentsOfDirectoryAtPath:[documentsURL path] error:nil];
    NSLog(@"%@", dirContents);
    [NSKeyedArchiver archiveRootObject:self.studentsArray toFile:studentPath];
    
    NSString *teacherPath = [codeFellowsPath stringByAppendingPathComponent:@"teachers"];
    
    [NSKeyedArchiver archiveRootObject:self.teachersArray toFile:teacherPath];
   // [self saveCodeFellowsList];
    
   // NSString *bundleRoot = [[NSBundle mainBundle] bundlePath];

    
    //NSArray *onlyJPGs = [dirContents filteredArrayUsingPredicate:fltr];
    
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
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [[_studentsArray objectAtIndex:indexPath.row] firstName], [[_studentsArray objectAtIndex:indexPath.row] lastName]];
            
            //cell.backgroundColor = [UIColor redColor];
            
            if ([_studentsArray[indexPath.row] favoriteColor]) {
                cell.backgroundColor = [_studentsArray[indexPath.row] favoriteColor];
            } else {
                cell.backgroundColor = [UIColor whiteColor];
            }
            
            return cell;
            break;
            
        case 1:
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [[_teachersArray objectAtIndex:indexPath.row] firstName], [[_teachersArray objectAtIndex:indexPath.row] lastName]];
            
            if ([_teachersArray[indexPath.row] favoriteColor]) {
                cell.backgroundColor = [_teachersArray[indexPath.row] favoriteColor];
            }  else {
                cell.backgroundColor = [UIColor whiteColor];
            }
            
            
            return cell;
            break;
            
        default:
            break;
    }
    
    return nil;
}
                                    
//- (void)saveCodeFellowsList
//{
//    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
//    NSString *codeFellowsPath = [documentsURL path];
//    codeFellowsPath = [codeFellowsPath stringByAppendingPathComponent:@"Bootcamp.plist"];
//    
//    if (![[NSFileManager defaultManager] fileExistsAtPath:codeFellowsPath])
//    {
//        NSArray *saveCodeFellows = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"]];
//        
//        [saveCodeFellows writeToFile:codeFellowsPath atomically:YES];
//    } else {
//        
//        for (CodeFellowModel *model in _teachersArray)
//        {
//            [_studentsArray addObject:model];
//        }
//        
//        [_studentsArray writeToFile:codeFellowsPath atomically:YES];
//    }
//}

@end