//
//  SFDetailViewController.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFDetailViewController.h"

@interface SFDetailViewController ()

@end

@implementation SFDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        
    //Random kitten generator
    //NSUInteger width = arc4random_uniform(140) + 200;
    //NSUInteger length = arc4random_uniform(140) + 200;
    
    if (_student){
        self.title = [NSString stringWithFormat:@"%@ %@", _student.studentFirstName, _student.studentLastName];
        //NSLog(@"%@", _student.studentImageLocation);
        
        self.classImage.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.png",[self documentsDirectoryPath], _student.studentName]];
        self.classImage.layer.cornerRadius = 120.f;
        self.classImage.layer.masksToBounds = YES;
    }
    
    if (_teacher) {
        self.title = [NSString stringWithFormat:@"%@ %@", _teacher.teacherFirstName, _teacher.teacherLastName];
    }
    
//    NSUInteger width = 240;
//    NSUInteger length = 240;
//    
//    NSString *kittenURL = [NSString stringWithFormat:@"http://placekitten.com/g/%i/%i", length, width];
//    
//    self.classImage.layer.cornerRadius = 120.f;
//    self.classImage.layer.masksToBounds = YES;
//    [self.classImage setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:kittenURL]]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Is camera available
- (void)showNoCameraAlert
{
        UIAlertView *cameraWarning = [[UIAlertView alloc] initWithTitle:@"No camera present"
                                                                message:@"You have to use your photo library because no camera is available!"
                                                               delegate:self
                                                      cancelButtonTitle:@"Cancel"
                                                      otherButtonTitles:@"Ok", nil];
        
        [cameraWarning show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld", (long)buttonIndex);
    if (buttonIndex == 1) {
        UIActionSheet *cameraSheet = [[UIActionSheet alloc] initWithTitle:@"Profile Photo Picker"
                                                                                                      delegate:self
                                                                                              cancelButtonTitle:@"Cancel"
                                                                                         destructiveButtonTitle:nil
                                                                                              otherButtonTitles:@"Photo Library", nil];
        [cameraSheet showInView:self.view];
    }
}

#pragma mark - UIAction Sheets

- (IBAction)classPhotoPicker:(id)sender
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self showNoCameraAlert];
    } else {
        UIActionSheet *cameraSheet = [[UIActionSheet alloc] initWithTitle:@"Profile Photo Picker"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"Camera", @"Photo Library", nil];
        
         [cameraSheet showFromBarButtonItem:sender animated:YES];
    }
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
        UIImagePickerController *classPicker = [UIImagePickerController new];
        classPicker.delegate = self;
        classPicker.allowsEditing = YES;
    
    
        if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Camera"])
        {
            NSLog(@"Camera");
        }
    
        if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Photo Library"])
        {
            NSLog(@"Photo Library");
        }
    
    [self presentViewController:classPicker animated:YES completion:nil];
    

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    self.classImage.image = editedImage;
    self.classImage.layer.cornerRadius = 120.f;
    self.classImage.layer.masksToBounds = YES;
    
    NSData *classPNGData = UIImagePNGRepresentation(editedImage);
    NSString *classPNGPath = [NSString stringWithFormat:@"%@/%@.png", [self documentsDirectoryPath], self.student.studentName];
    [classPNGData writeToFile:classPNGPath atomically:YES];


    _student.studentImageLocation = classPNGPath;
    
        NSLog(@"%@", _student.studentImageLocation);
    
   // NSString *pngPath = [[self docsDirPath] stringByAppendingPathComponent:@"test.png"]
    
    //self.student.studentImage = self.classImage.image;
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];

}

- (NSString *)documentsDirectoryPath
{
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    return [documentsURL path];
}

@end