//
//  DNVedioView.m
//  DNProject
//
//  Created by zjs on 2018/8/22.
//  Copyright © 2018年 zjs. All rights reserved.
//

#import "DNVedioView.h"

@interface DNVedioView ()

@property (nonatomic,   weak) AVPlayerLayer * playLayer;
@property (nonatomic, strong) AVPlayer * player;
@property (nonatomic, strong) AVPlayerItem * playerItem;
// 当前已经播放的时间
@property (nonatomic, strong) UILabel * currentTime;
// 视频的总时间
@property (nonatomic, strong) UILabel * vedioSumTime;
// 视频播放的进度条
@property (nonatomic, strong) UISlider * playProgress;
// 开始播放的按钮
@property (nonatomic, strong) UIButton * startPlayButton;
// 全屏的按钮
@property (nonatomic, strong) UIButton * fullScreenButton;
// 是否获取了视频长度
@property (nonatomic, assign) BOOL isFetchTotalDuration;

@property (nonatomic, strong) id timeObserver;
@property (nonatomic, assign) NSTimeInterval bufferTime;

@end

@implementation DNVedioView

//- (instancetype)initWithURL:(NSString *)vedioURL {
//    
//    self = [super init];
//    if (self) {
//        
//        NSURL * urlstr = [NSURL URLWithString:vedioURL];
//        self.playerItem = [AVPlayerItem playerItemWithURL:urlstr];
//        self.player = [[AVPlayer alloc] initWithPlayerItem:self.playerItem];
//        self.playLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
//        
//        [self.layer addSublayer:self.playLayer];
//        
//        //监听status属性
//        [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
//        
//        [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
//    }
//    return self;
//}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        NSURL * urlstr = [NSURL URLWithString:self.vedioURL];
        self.playerItem = [AVPlayerItem playerItemWithURL:urlstr];
        self.player = [[AVPlayer alloc] initWithPlayerItem:self.playerItem];
        self.playLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        
        [self.layer addSublayer:self.playLayer];
        
        [self.player addBoundaryTimeObserverForTimes:@[@1.f]
                                               queue:dispatch_get_main_queue() usingBlock:^{
            
        }];
        
        //监听status属性
        [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        
        [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)setVedioURL:(NSString *)vedioURL {
    _vedioURL = vedioURL;
}

//kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    AVPlayerItem *item = (AVPlayerItem *)object;
    
    if ([keyPath isEqualToString:@"status"])
    {
        NSLog(@"%d", (int)[item status]);
        if ([item status] == AVPlayerStatusReadyToPlay)
        {
            
            [self monitorPlayingStatusWithItem:item];
            
        }
    }
    else if ([keyPath isEqualToString:@"loadedTimeRanges"])    //缓冲
    {
        self.bufferTime = [self availableBufferTime];
        
        if (!self.isFetchTotalDuration)
        {
            //获取视频总长度
            NSTimeInterval totalDuration = CMTimeGetSeconds(item.duration);
            self.vedioSumTime.text = [NSString stringWithFormat:@"%f",totalDuration];
            self.isFetchTotalDuration = YES;
        }
        
//        if (self.currentPlayTime <= self.transport.durationTime - 7)
//        {
//            //如果缓冲不够
//            if (self.bufferTime <= self.transport.currentPlayTime + 5)
//            {
//                self.transport.isBuffering = YES;
//            }
//            else
//            {
//                self.transport.isBuffering = NO;
//            }
//        }
//        else
//        {
//            self.transport.isBuffering = NO;
//        }
        
//        self.transport.currentBufferTime = self.bufferTime;
        
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

/**
 *  监听播放状态
 */
- (void)monitorPlayingStatusWithItem:(AVPlayerItem *)item
{
    //__weak typeof(self) tmp = self;
    self.timeObserver = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        
        //NSTimeInterval currentTime = CMTimeGetSeconds(time);
        
        //tmp.transport.currentPlayTime = currentTime;
        
        
    }];
}

/**
 *  可用的播放时长(缓冲的时长)
 */
- (NSTimeInterval)availableBufferTime
{
    NSArray *loadTimeRanges = [[self.player currentItem] loadedTimeRanges];
    
    //获取缓冲区域
    CMTimeRange range = [loadTimeRanges.firstObject CMTimeRangeValue];
    
    NSTimeInterval startTime = CMTimeGetSeconds(range.start);
    
    NSTimeInterval duration = CMTimeGetSeconds(range.duration);
    
    return startTime + duration;
}

@end
