//
//  SFDetailViewController.h
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)dismissView:(id)sender;

@end