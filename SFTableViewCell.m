//
//  SFTableViewCell.m
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/17/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFTableViewCell.h"

@implementation SFTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCodeFellow:(CodeFellowModel *)codeFellow
{
    _codeFellow = codeFellow;
    
    self.textLabel.text = [NSString stringWithFormat:@"%@ %@", [codeFellow firstName], [codeFellow lastName]];
    
    //Set favorite color on cell
    if (codeFellow.favoriteColor) {
        self.backgroundColor = codeFellow.favoriteColor;
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
    
    //Set image on cell
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSString *tempString = [NSString stringWithFormat:@"%@/%@.jpg",[documentsURL path], codeFellow.fullName];
    UIImage *image = [UIImage imageWithContentsOfFile:tempString];
    
    if (image) {
        self.imageView.image = image;
    } else {
        
    }
}

@end
