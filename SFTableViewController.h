//
//  SFTableViewController.h
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFDetailViewController.h"

@interface SFTableViewController : UITableViewController <UIActionSheetDelegate>
- (IBAction)sortNames:(id)sender;

@end
