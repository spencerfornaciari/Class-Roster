//
//  SFDetailViewController.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/13/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFDetailViewController.h"

@interface SFDetailViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *codeFellowScrollView;
- (IBAction)setTwitter:(id)sender;
- (IBAction)setGitHub:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *setButton;
- (IBAction)setImage:(id)sender;

@end

@implementation SFDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.codeFellowScrollView.contentSize = CGSizeMake(1000, 1000);
    self.codeFellowScrollView.delegate = self;

    self.title = _codeFellow.fullName;
    
    //Test to see if an image is availble or to use the default image
    NSString *tempString = [NSString stringWithFormat:@"%@/%@.jpg",[self documentsDirectoryPath], _codeFellow.fullName];
    UIImage *image = [UIImage imageWithContentsOfFile:tempString];
    
    if (!image) {
        [self.setButton setBackgroundImage:[UIImage imageNamed:@"default.jpg"] forState:UIControlStateNormal];
    } else {
        [self.setButton setBackgroundImage:image forState:UIControlStateNormal];
   }

    self.setButton.layer.cornerRadius = 120.f;
    self.setButton.layer.masksToBounds = YES;
    
    //Setting Twitter text if it exists
    self.codeFellowTwitter.text = _codeFellow.twitter;
    self.codeFellowTwitter.delegate = self;
    self.codeFellow.twitter = self.codeFellowTwitter.text;
    
    //Setting GitHub text if it exists
    self.codeFellowGitHub.text = _codeFellow.github;
    self.codeFellowGitHub.delegate = self;
    self.codeFellow.github = self.codeFellowGitHub.text;
    
    [_codeFellowScrollView addSubview:self.setButton];
    [_codeFellowScrollView addSubview:self.codeFellowTwitter];
    [_codeFellowScrollView addSubview:self.codeFellowGitHub];
}

- (void)viewWillAppear:(BOOL)animated{
    if (self.codeFellow.favoriteColor)
    {
        self.view.backgroundColor = _codeFellow.favoriteColor;
    }
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

#pragma mark - No photo library available

- (void)noPhotoLibraryAvailable
{
    UIAlertView *photoWarning = [[UIAlertView alloc] initWithTitle:@"No photo library access"
                                                            message:@"We can't privledges to access your photo library!"
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil, nil];
    
    [photoWarning show];

}

#pragma mark - UIAction Sheets

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
        UIImagePickerController *classPicker = [UIImagePickerController new];
        classPicker.delegate = self;
        classPicker.allowsEditing = YES;
    
        if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Camera"])
        {
            classPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
    
        if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Photo Library"])
        {
            ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
            if (authStatus == ALAuthorizationStatusRestricted || authStatus == ALAuthorizationStatusDenied) {
                [self noPhotoLibraryAvailable];
            } else {
                classPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
        }
    
    [self presentViewController:classPicker animated:YES completion:nil];
    

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    [self.setButton setBackgroundImage:editedImage forState:UIControlStateNormal];
    self.setButton.layer.cornerRadius = 120.f;
    self.setButton.layer.masksToBounds = YES;
    
    NSData *codeFellowJPGData = UIImageJPEGRepresentation(editedImage, 0.5);
    NSString *codeFellowJPGPath = [NSString stringWithFormat:@"%@/%@.jpg", [self documentsDirectoryPath], self.codeFellow.fullName];
    [codeFellowJPGData writeToFile:codeFellowJPGPath atomically:YES];
    

    _codeFellow.imageLocation = codeFellowJPGPath;
    _codeFellow.profileImage = editedImage;
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];

}

- (NSString *)documentsDirectoryPath
{
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    return [documentsURL path];
}

#pragma mark - IBAction code

- (IBAction)setTwitter:(id)sender {
    _codeFellow.twitter = _codeFellowTwitter.text;
    [sender resignFirstResponder];
}

- (IBAction)setGitHub:(id)sender {
    _codeFellow.github = _codeFellowGitHub.text;
    [sender resignFirstResponder];


}

- (IBAction)setImage:(id)sender {
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

#pragma mark - UITextField Delegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Prepare for segue to modal controller

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SFColorViewController *colorView = segue.destinationViewController;
    
    colorView.colorPicker = _codeFellow;
    
}


@end