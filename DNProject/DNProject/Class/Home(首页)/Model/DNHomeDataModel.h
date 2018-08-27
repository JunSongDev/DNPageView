//
//  DNHomeDataModel.h
//  DNProject
//
//  Created by zjs on 2018/8/21.
//  Copyright © 2018年 zjs. All rights reserved.
//

#import "DNBaseModel.h"

@interface DNHomeDataModel : DNBaseModel

@property (nonatomic, copy) NSString * type;
@property (nonatomic, copy) NSString * text;
@property (nonatomic, copy) NSString * user_id;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * screen_name;
@property (nonatomic, copy) NSString * profile_image;
@property (nonatomic, copy) NSString * create_at;
@property (nonatomic, copy) NSString * create_time;
@property (nonatomic, copy) NSString * passtime;
@property (nonatomic, copy) NSString * love;
@property (nonatomic, copy) NSString * hate;
@property (nonatomic, copy) NSString * coment;
@property (nonatomic, copy) NSString * repost;
@property (nonatomic, copy) NSString * bookmark;
@property (nonatomic, copy) NSString * bimageuri;
@property (nonatomic, copy) NSString * voiceuri;
@property (nonatomic, copy) NSString * voicetime;
@property (nonatomic, copy) NSString * voicelength;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * theme_id;
@property (nonatomic, copy) NSString * theme_name;
@property (nonatomic, copy) NSString * theme_type;
@property (nonatomic, copy) NSString * videouri;
@property (nonatomic, copy) NSString * original_pid;
@property (nonatomic, copy) NSString * playcount;
@property (nonatomic, copy) NSString * playfcount;
@property (nonatomic, copy) NSString * cai;
@property (nonatomic, copy) NSString * weixin_url;
@property (nonatomic, copy) NSString * image0;
@property (nonatomic, copy) NSString * image1;
@property (nonatomic, copy) NSString * image2;
@property (nonatomic, copy) NSString * image_small;
@property (nonatomic, copy) NSString * cdn_img;
@property (nonatomic, copy) NSString * tag;
@property (nonatomic, copy) NSString * ding;
@property (nonatomic, copy) NSString * favourite;
@property (nonatomic, copy) NSString * top_cmt;
@property (nonatomic, copy) NSString * themes;

@property (nonatomic, assign) BOOL       is_gif;
@property (nonatomic, assign) CGFloat    width;
@property (nonatomic, assign) CGFloat    height;
@property (nonatomic, assign) NSInteger  t;
@property (nonatomic, assign) NSInteger  videotime;
@property (nonatomic, assign) NSInteger  cache_version;

@end
