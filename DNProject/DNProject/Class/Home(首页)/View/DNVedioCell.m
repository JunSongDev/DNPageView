//
//  DNVedioCell.m
//  DNProject
//
//  Created by zjs on 2018/8/21.
//  Copyright © 2018年 zjs. All rights reserved.
//

#import "DNVedioCell.h"
#import "DNVedioPlayView.h"
#import <AVFoundation/AVFoundation.h>

@interface DNVedioCell ()

@property (nonatomic, strong) UILabel * authorLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UIImageView * headImage;
@property (nonatomic, strong) UIImageView * contentImage;
@property (nonatomic, strong) UIView * bottomView;
@property (nonatomic, strong) UIButton * playButton;
@end

@implementation DNVedioCell

- (void)setSubviewsForSuper {
    
    self.headImage = [[UIImageView alloc] init];
    self.headImage.layer.cornerRadius = SCREEN_W*0.03;
    self.headImage.layer.masksToBounds = YES;

    self.contentImage = [[UIImageView alloc] init];
    self.contentImage.contentMode = UIViewContentModeScaleAspectFit;
    self.contentImage.clipsToBounds = YES;
    
    self.bottomView = [[UIView alloc] init];
    
    self.authorLabel = [UILabel dn_labelWithText:@""
                                        textFont:16
                                       textColor:UIColor.blackColor
                                    textAligment:NSTextAlignmentLeft];
    
    self.contentLabel = [UILabel dn_labelWithText:@""
                                         textFont:14
                                        textColor:UIColor.blackColor
                                     textAligment:NSTextAlignmentLeft];
    self.contentLabel.numberOfLines = 0;

    self.playButton = [[UIButton alloc] init];
    [self.playButton setImage:[UIImage imageNamed:@"play"]
                     forState:UIControlStateNormal];
    
    [self.contentView addSubview:self.headImage];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.contentImage];
    [self.contentView addSubview:self.bottomView];
    [self.contentView addSubview:self.playButton];
}

- (void)addConstraintsForSuper{
    
    CGFloat height = (SCREEN_W - DN_SPACE(24))*9/16;
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(self.contentView).inset(DN_SPACE(25));
        make.width.height.mas_equalTo(@(SCREEN_W*0.06));
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.headImage.mas_top);
        make.left.mas_equalTo(self.headImage.mas_right).mas_offset(DN_SPACE(10));
        make.right.mas_equalTo(self.contentView.mas_right).inset(DN_SPACE(10));
        //make.height.mas_equalTo(@(SCREEN_W*0.05));
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.headImage.mas_bottom).mas_offset(DN_SPACE(8));
        make.left.right.mas_equalTo(self.contentView).inset(DN_SPACE(12));
    }];
    
    [self.contentImage mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(DN_SPACE(8));
        make.left.right.mas_equalTo(self.contentView).inset(DN_SPACE(12));
        make.height.mas_equalTo(@(height));
    }];
    
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(self.contentImage.mas_centerX);
        make.centerY.mas_equalTo(self.contentImage.mas_centerY);
        make.width.height.mas_equalTo(@(SCREEN_W*0.12));
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentImage.mas_bottom).mas_offset(DN_SPACE(8));
        make.left.bottom.right.mas_equalTo(self.contentView).inset(DN_SPACE(12));
    }];
}


- (void)setModel:(DNHomeDataModel *)model {
    
    _model = model;
    
    self.authorLabel.text = model.name;
    self.contentLabel.text = model.text;
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.profile_image]];
    [self.contentImage sd_setImageWithURL:[NSURL URLWithString:model.image1]];
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
