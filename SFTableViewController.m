//
//  SFTableViewController.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFTableViewController.h"

@interface SFTableViewController ()
@property (strong, nonatomic) NSArray *studentsArray;
@property (nonatomic,retain) UIRefreshControl *refreshControl;

@end

@implementation SFTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *student1 = @"Nicholas Barnard";
    NSString *student2 = @"Zuri Biringer";
    NSString *student3 = @"Chad Colby";
    NSString *student4 = @"Spencer Fornaciari";
    NSString *student5 = @"Raghav Haran";
    NSString *student6 = @"Timothy Hise";
    NSString *student7 = @"Ivan Lesko";
    NSString *student8 = @"Richard Lichkus";
    NSString *student9 = @"Bennett Lin";
    NSString *student10 = @"Christopher Meehan";
    NSString *student11 = @"Matt Remick";
    NSString *student12 = @"Andrew Rodgers";
    NSString *student13 = @"Jeff Schwab";
    NSString *student14 = @"Steven Stevenson";
    NSString *student15 = @"Ivan Storck";
    NSString *student16 = @"Yair Szarf";
    
    self.studentsArray = [NSArray arrayWithObjects:student1, student2, student3, student4, student5, student6, student7, student8, student9, student10, student11, student12, student13, student14, student15, student16, nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.studentsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
