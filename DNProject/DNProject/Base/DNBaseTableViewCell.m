//
//  DNBaseTableViewCell.m
//  DNProject
//
//  Created by zjs on 2018/8/21.
//  Copyright © 2018年 zjs. All rights reserved.
//

#import "DNBaseTableViewCell.h"

@implementation DNBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setSubviewsForSuper];
        [self addConstraintsForSuper];
    }
    return self;
}

- (void)setSubviewsForSuper {
    
    
}

- (void)addConstraintsForSuper {
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
