//
//  DNVedioPlayView.m
//  DNProject
//
//  Created by zjs on 2018/8/22.
//  Copyright © 2018年 zjs. All rights reserved.
//

#import "DNVedioPlayView.h"

@interface DNVedioPlayView ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *startPlayButton;
@property (weak, nonatomic) IBOutlet UILabel *currentPlayLabel;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UILabel *vedioCountTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *fullScreenButton;

@end

@implementation DNVedioPlayView

+ (instancetype)loadPlayView {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"DNVedioPlayView" owner:nil options:nil] firstObject];
}

@end
