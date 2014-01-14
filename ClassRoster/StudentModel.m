//
//  StudentModel.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/14/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

-(id)initWithCoder:(NSCoder *)decoder
{
        if (self = [super init])
        {
            self.studentName = [decoder decodeObjectForKey:@"name"];
            self.studentTwitter = [decoder decodeObjectForKey:@"twitter"];
            self.studentGithub = [decoder decodeObjectForKey:@"github"];
            
            return self;
        }
    
    return nil;
}

-(void)encodeWithEncoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.studentName forKey:@"name"];
    [encoder encodeObject:self.studentTwitter forKey:@"twitter"];
    [encoder encodeObject:self.studentGithub forKey:@"github"];
}

@end
