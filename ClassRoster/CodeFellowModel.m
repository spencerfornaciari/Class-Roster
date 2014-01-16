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
        self.twitter = [decoder decodeObjectForKey:@"twitter"];
        self.github = [decoder decodeObjectForKey:@"github"];
        //self.isStudent = [[decoder decodeObjectForKey:@"student"] boolValue];
        
        return self;
    }
    
    return nil;
}

-(void)encodeWithEncoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.fullName forKey:@"name"];
    [encoder encodeObject:self.twitter forKey:@"twitter"];
    [encoder encodeObject:self.github forKey:@"github"];
    //[encoder encodeObject:[self.isStudent charValue] forKey:@"student"];
}

@end
