//
//  DiscoveredViewCell.m
//  DesignPageTest
//
//  Created by Michael Parris on 1/14/14.
//  Copyright (c) 2014 Michael Parris. All rights reserved.
//

#import "DiscoveredViewCell.h"

@implementation DiscoveredViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label.text = @"Balls";
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
