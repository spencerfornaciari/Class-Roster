//
//  PersonModel.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/15/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "CodeFellowModel.h"

@implementation CodeFellowModel

-(id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
        self.fullName = [decoder decodeObjectForKey:@"name"];
        self.firstName = [decoder decodeObjectForKey:@"firstName"];
        self.lastName = [decoder decodeObjectForKey:@"lastName"];
        self.twitter = [decoder decodeObjectForKey:@"twitter"];
        self.github = [decoder decodeObjectForKey:@"github"];
        self.imageLocation = [decoder decodeObjectForKey:@"imageLocation"];
        self.favoriteColor = [decoder decodeObjectForKey:@"favoriteColor"];
        self.isStudent = [[decoder decodeObjectForKey:@"isStudent"] boolValue];
        
        return self;
    }
    
    return nil;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.fullName forKey:@"name"];
    [encoder encodeObject:self.firstName forKey:@"firstName"];
    [encoder encodeObject:self.lastName forKey:@"lastName"];
    [encoder encodeObject:self.twitter forKey:@"twitter"];
    [encoder encodeObject:self.github forKey:@"github"];
    [encoder encodeObject:self.imageLocation forKey:@"imageLocation"];
    [encoder encodeObject:self.favoriteColor forKey:@"favoriteColor"];
    [encoder encodeBool:self.isStudent forKey:@"isStudent"];
}

@end
