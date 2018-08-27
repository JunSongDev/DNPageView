//
//  DNTextCell.m
//  DNProject
//
//  Created by zjs on 2018/8/21.
//  Copyright © 2018年 zjs. All rights reserved.
//

#import "DNTextCell.h"

@interface DNTextCell ()

@property (nonatomic, strong) UILabel * authorLabel;
@property (nonatomic, strong) UILabel * publicTime;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UIImageView * headImage;
@end

@implementation DNTextCell

- (void)setSubviewsForSuper {
    
    self.headImage = [[UIImageView alloc] init];
    self.headImage.layer.cornerRadius = SCREEN_W*0.03;
    self.headImage.layer.masksToBounds = YES;
    
    self.authorLabel = [UILabel dn_labelWithText:@""
                                        textFont:16
                                       textColor:UIColor.blackColor
                                    textAligment:NSTextAlignmentLeft];
    
    self.publicTime  = [UILabel dn_labelWithText:@""
                                        textFont:12
                                       textColor:UIColor.blackColor
                                    textAligment:NSTextAlignmentLeft];
    
    self.contentLabel = [UILabel dn_labelWithText:@""
                                         textFont:14
                                        textColor:UIColor.darkGrayColor
                                     textAligment:NSTextAlignmentLeft];
    self.contentLabel.numberOfLines = 0;
    
    [self.contentView addSubview:self.headImage];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.publicTime];
    [self.contentView addSubview:self.contentLabel];
}

- (void)addConstraintsForSuper {
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.mas_equalTo(self.contentView).inset(DN_SPACE(25));
        make.width.height.mas_equalTo(@(SCREEN_W*0.06));
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.headImage.mas_top);
        make.left.mas_equalTo(self.headImage.mas_right).mas_offset(DN_SPACE(10));
        make.height.mas_equalTo(@(SCREEN_W*0.05));
    }];
    
//    [self.publicTime mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.bottom.mas_equalTo(self.headImage.mas_bottom);
//        make.left.mas_equalTo(self.headImage.mas_left).mas_offset(DN_SPACE(10));
//        make.height.mas_equalTo(@(SCREEN_W*0.05));
//    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.headImage.mas_bottom).mas_offset(DN_SPACE(8));
        make.left.bottom.right.mas_equalTo(self.contentView).inset(DN_SPACE(12));
    }];
}

- (void)setModel:(DNHomeDataModel *)model {
    
    _model = model;
    //DNLog(@"%@===%@",model.create_at,model.profile_image);
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.profile_image]];
    self.authorLabel.text = model.name;
    self.publicTime.text  = model.create_at;
    self.contentLabel.text = model.text;
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
