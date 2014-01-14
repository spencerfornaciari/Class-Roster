//
//  StudentModel.h
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/14/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentModel : NSObject

@property (nonatomic) NSString *studentName;
@property (nonatomic) NSString *studentFirstName;
@property (nonatomic) NSString *studentLastName;
@property (nonatomic) NSString *studentTwitter;
@property (nonatomic) NSString *studentGithub;
@property (nonatomic) UIImage *studentImage;

@end
