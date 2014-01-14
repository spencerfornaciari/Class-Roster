//
//  SFTableViewController.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFTableViewController.h"
#import "SFStudentModelDataController.h"
#import "SFTeacherModelDataController.h"
#import "StudentModel.h"
#import "TeacherModel.h"

@interface SFTableViewController ()
@property (strong, nonatomic) NSMutableArray *studentsArray;
@property (strong, nonatomic) NSMutableArray *teachersArray;

@property (nonatomic,retain) UIRefreshControl *refresh;

@property (nonatomic) BOOL sortStudents;
@property (nonatomic) BOOL sortTeachers;


@end

@implementation SFTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _sortStudents = TRUE;
    _sortTeachers = TRUE;
    _studentsArray = [SFStudentModelDataController populateStudentData];
    _teachersArray = [SFTeacherModelDataController populateTeacherData];
    
    _refresh = [[UIRefreshControl alloc] init];
    _refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [_refresh addTarget:self
                 action:nil
       forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = _refresh;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            
            //[[_teachersArray objectAtIndex:indexPath.row] teacherName];
            return cell;
            break;
            
        default:
            break;
    }
    
    return nil;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender;
    
    SFDetailViewController *detailView = segue.destinationViewController;
    detailView.title = cell.textLabel.text;
 
}

#pragma mark - UIActionSheet

- (IBAction)sortNames:(id)sender {
    
    //Create the UIAction sheet and display it
    UIActionSheet *sortOptions = [[UIActionSheet alloc] initWithTitle:@"Sort Options"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:nil otherButtonTitles:@"Students", @"Teachers", nil];
    
    [sortOptions showInView:self.view];
}

// Responses to UIActionSheet selections
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
        {
            {
                if (_sortStudents){
                    NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"studentFirstName" ascending:YES];
                    _studentsArray = [NSMutableArray arrayWithArray:[_studentsArray sortedArrayUsingDescriptors:@[nameSorter]]];
                    
                    _sortStudents = FALSE;
                    
                    [self.tableView reloadData];
                } else {
                    NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"studentLastName" ascending:YES];
                    _studentsArray = [NSMutableArray arrayWithArray:[_studentsArray sortedArrayUsingDescriptors:@[nameSorter]]];
                    
                    _sortStudents = TRUE;
                    [self.tableView reloadData];
                }
            }
        }
            break;
            
        case 1:
        {
            if (_sortTeachers){
                NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"teacherFirstName" ascending:YES];
                _teachersArray = [NSMutableArray arrayWithArray:[_teachersArray sortedArrayUsingDescriptors:@[nameSorter]]];
                
                _sortTeachers = FALSE;
                
                [self.tableView reloadData];
            } else {
                NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"teacherLastName" ascending:YES];
                _teachersArray = [NSMutableArray arrayWithArray:[_teachersArray sortedArrayUsingDescriptors:@[nameSorter]]];
                
                _sortTeachers = TRUE;
                [self.tableView reloadData];
            }
        }
            
            break;
    }
}

@end