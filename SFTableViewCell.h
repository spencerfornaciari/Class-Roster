//
//  SFTableViewCell.h
//  ClassRoster
//
//  Created by Spencer Fornaciari on 1/17/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CodeFellowModel.h"

@interface SFTableViewCell : UITableViewCell

@property (nonatomic, weak) CodeFellowModel *codeFellow;

- (void)setCodeFellow:(CodeFellowModel *)codeFellow;

@end
