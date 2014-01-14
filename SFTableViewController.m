//
//  SFTableViewController.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFTableViewController.h"
#import "StudentModel.h"

@interface SFTableViewController ()
@property (strong, nonatomic) NSMutableArray *studentsArray;
@property (strong, nonatomic) NSMutableArray *originalArray;
@property (strong, nonatomic) NSArray *teachersArray;


@property (nonatomic,retain) UIRefreshControl *refresh;

@end

@implementation SFTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _studentsArray = [NSMutableArray new];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"];
    _originalArray = [NSMutableArray arrayWithContentsOfFile:path];
    //NSLog(@"%@", _originalArray);
    
    for (NSDictionary *dict in _originalArray)
    {
        StudentModel *model = [StudentModel new];
        model.studentName = dict[@"name"];
        model.studentTwitter = dict[@"twitter"];
        model.studentGithub = dict[@"github"];
        
        [_studentsArray addObject:model];
    }
    
    NSString *teacher1 = @"John Clem";
    NSString *teacher2 = @"Brad Johnson";

    
    self.teachersArray = [NSArray arrayWithObjects:teacher1, teacher2, nil];
    
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
        return self.teachersArray.count;
    }
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [[_studentsArray objectAtIndex:indexPath.row] studentName];
            return cell;
            break;
            
        case 1:
            cell.textLabel.text = [self.teachersArray objectAtIndex:indexPath.row];
            return cell;
            break;
            
        default:
            break;
    }
    /*
    if (indexPath.section == 0) {
        cell.textLabel.text = [self.studentsArray objectAtIndex:indexPath.row];
        
        return cell;
    }
    
    if (indexPath.section == 1) {
        cell.textLabel.text = [self.teachersArray objectAtIndex:indexPath.row];
        
        return cell;
    }*/
    
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

@end
