//
//  TeacherModel.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/14/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "TeacherModel.h"

@implementation TeacherModel

-(id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
        self.teacherName = [decoder decodeObjectForKey:@"name"];
        self.teacherTwitter = [decoder decodeObjectForKey:@"twitter"];
        self.teacherGithub = [decoder decodeObjectForKey:@"github"];
        
        return self;
    }
    
    return nil;
}

-(void)encodeWithEncoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.teacherName forKey:@"name"];
    [encoder encodeObject:self.teacherTwitter forKey:@"twitter"];
    [encoder encodeObject:self.teacherGithub forKey:@"github"];
}

@end
