//
//  PersonModel.h
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/15/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodeFellowModel : NSObject

@property (nonatomic) NSString *fullName;
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *twitter;
@property (nonatomic) NSString *github;
@property (nonatomic) NSString *imageLocation;
@property (nonatomic) UIImage *profileImage;
@property (nonatomic) BOOL isStudent;

@end
