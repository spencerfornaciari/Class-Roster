//
//  SFTableViewController.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFTableViewController.h"
#import "SFModelDataController.h"
#import "CodeFellowModel.h"

@interface SFTableViewController ()

@property (nonatomic,retain) UIRefreshControl *refresh;

@property (nonatomic, strong) SFModelDataController *myModelController;

@property (nonatomic) BOOL sortStudents;
@property (nonatomic) BOOL sortTeachers;
@property (nonatomic) NSString *codeFellowsPath;
@property (nonatomic) NSString *studentPath;
@property (nonatomic) NSString *teacherPath;

@end

@implementation SFTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    _codeFellowsPath = [documentsURL path];
    _studentPath = [_codeFellowsPath stringByAppendingPathComponent:@"students"];
    _teacherPath = [_codeFellowsPath stringByAppendingPathComponent:@"teachers"];

    _myModelController = [SFModelDataController new];
    
    BOOL existingFile = [self doesPListExist];
    
    if (existingFile) {
        self.myModelController.studentsArray = [NSKeyedUnarchiver unarchiveObjectWithFile:self.studentPath];
        self.myModelController.teachersArray = [NSKeyedUnarchiver unarchiveObjectWithFile:self.teacherPath];
    } else {
        [self.myModelController populatePersonData];
    }
    
    _sortStudents = TRUE;
    _sortTeachers = TRUE;
    
    self.tableView.dataSource = self.myModelController;
    
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

- (void)viewWillAppear:(BOOL)animated
{
    
    [NSKeyedArchiver archiveRootObject:self.myModelController.studentsArray toFile:self.studentPath];
    
    [NSKeyedArchiver archiveRootObject:self.myModelController.teachersArray toFile:self.teacherPath];
   
    [self.tableView reloadData];
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
    SFDetailViewController *detailView = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if (indexPath.section == 0) {
        detailView.codeFellow = self.myModelController.studentsArray[indexPath.row];
    }
    
    if (indexPath.section == 1) {
        detailView.codeFellow = self.myModelController.teachersArray[indexPath.row];
    }
    
    detailView.view.backgroundColor = [UIColor whiteColor];
 
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
                    NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES];
                    self.myModelController.studentsArray = [NSMutableArray arrayWithArray:[self.myModelController.studentsArray sortedArrayUsingDescriptors:@[nameSorter]]];
                    
                    _sortStudents = FALSE;
                    
                    [self.tableView reloadData];
                } else {
                    NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES];
                    self.myModelController.studentsArray = [NSMutableArray arrayWithArray:[self.myModelController.studentsArray sortedArrayUsingDescriptors:@[nameSorter]]];
                    
                    _sortStudents = TRUE;
                    
                    [self.tableView reloadData];
                }
            }
        }
            break;
            
        case 1:
        {
            if (_sortTeachers){
                NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES];
                self.myModelController.teachersArray = [NSMutableArray arrayWithArray:[self.myModelController.teachersArray sortedArrayUsingDescriptors:@[nameSorter]]];
                
                _sortTeachers = FALSE;
                
                [self.tableView reloadData];
            } else {
                NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES];
                self.myModelController.teachersArray = [NSMutableArray arrayWithArray:[self.myModelController.teachersArray sortedArrayUsingDescriptors:@[nameSorter]]];
                
                _sortTeachers = TRUE;
                
                [self.tableView reloadData];
            }
        }
            
            break;
    }
}

-(BOOL)doesPListExist
{
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    NSString *codeFellowsPath = [documentsURL path];
    codeFellowsPath = [codeFellowsPath stringByAppendingPathComponent:@"students"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:codeFellowsPath]) {
        return FALSE;
    } else {
        return TRUE;
    }
}

@end