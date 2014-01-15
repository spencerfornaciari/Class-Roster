//
//  SFDetailViewController.h
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentModel.h"
#import "TeacherModel.h"

@interface SFDetailViewController : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) StudentModel *student;
@property (weak, nonatomic) TeacherModel *teacher;

@property (weak, nonatomic) IBOutlet UIImageView *classImage;
@property (weak, nonatomic) IBOutlet UITextField *classTwitter;
@property (weak, nonatomic) IBOutlet UITextField *classGitHub;


@end
