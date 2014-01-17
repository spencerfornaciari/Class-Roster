//
//  SFDetailViewController.h
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "CodeFellowModel.h"
#import "SFColorViewController.h"

@interface SFDetailViewController : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, UIScrollViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) CodeFellowModel *codeFellow;
@property (weak, nonatomic) IBOutlet UITextField *codeFellowTwitter;
@property (weak, nonatomic) IBOutlet UITextField *codeFellowGitHub;


@end
