//
//  TeacherModel.h
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/14/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeacherModel : NSObject

@property (nonatomic) NSString *teacherName;
@property (nonatomic) NSString *teacherFirstName;
@property (nonatomic) NSString *teacherLastName;
@property (nonatomic) NSString *teacherTwitter;
@property (nonatomic) NSString *teacherGithub;
@property (nonatomic) UIImage *teacherImage;

@end
