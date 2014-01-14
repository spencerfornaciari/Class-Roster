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
    
    NSUInteger width = 240;
    NSUInteger length = 240;
    
    NSString *kittenURL = [NSString stringWithFormat:@"http://placekitten.com/g/%i/%i", length, width];
    
    [self.classImage setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:kittenURL]]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end