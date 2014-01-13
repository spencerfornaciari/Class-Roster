//
//  SFViewController.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()
@property (weak, nonatomic) IBOutlet UITableView *classTableview;
@property (strong, nonatomic) NSArray *studentsArray;

@end

@implementation SFViewController

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
    
    self.classTableview.delegate = self;
    self.classTableview.dataSource = self;
    
    /*
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refresh addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
    */

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.studentsArray.count;
}

- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.studentsArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SFDetailViewController *detailView = segue.destinationViewController;
    detailView.nameLabel.text = @"Blah";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
