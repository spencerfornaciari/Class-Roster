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


@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    
    self.classTableview.delegate = self;
    self.classTableview.dataSource = self;
    

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
    UITableViewCell *cell = (UITableViewCell *)sender;
    
    SFDetailViewController *detailView = segue.destinationViewController;
    
    detailView.name = cell.textLabel.text;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
