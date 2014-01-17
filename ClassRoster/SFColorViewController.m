//
//  SFColorViewController.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/16/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFColorViewController.h"

@interface SFColorViewController ()
- (IBAction)setRedValue:(id)sender;
- (IBAction)setGreenValue:(id)sender;
- (IBAction)setBlueValue:(id)sender;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIButton *colorSelectorButton;

@property (nonatomic) float red;
@property (nonatomic) float green;
@property (nonatomic) float blue;

- (IBAction)acceptBackgroundColor:(id)sender;

@end

@implementation SFColorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _colorSelectorButton.backgroundColor = [UIColor redColor];
    [_colorSelectorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setRedValue:(id)sender {
    _red = _redSlider.value;
    [self updateBackgroundColor];
}

- (IBAction)setGreenValue:(id)sender {
    _green = _greenSlider.value;
    [self updateBackgroundColor];

}

- (IBAction)setBlueValue:(id)sender {
    _blue = _blueSlider.value;
    [self updateBackgroundColor];

}

-(void)updateBackgroundColor
{
    self.view.backgroundColor = [UIColor colorWithRed:_red
                                                green:_green
                                                 blue:_blue
                                                alpha: 1];
}

- (IBAction)acceptBackgroundColor:(id)sender {
    
    _colorPicker.favoriteColor = self.view.backgroundColor;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
