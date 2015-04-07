//
//  ALMoviePlayerControlsBase.m
//  AsYoutubeiPadSwiftClient
//
//  Created by djzhang on 4/7/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import "ALMoviePlayerControlsBase.h"
#import "ALMoviePlayerControls.h"
#import "ALMoviePlayerController.h"
#import "ALButton.h"

@interface ALMoviePlayerControlsBase ()

@end

@implementation ALMoviePlayerControlsBase


- (void)hideControls:(void (^)(void))completion {

    self.neverHide = YES;

    if(self.isShowing && !self.neverHide) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideControls:) object:nil];
        [UIView animateWithDuration:0.3 delay:0.0 options:0 animations:^{
            if(self.style == ALMoviePlayerControlsStyleFullscreen || (self.style == ALMoviePlayerControlsStyleDefault && self.moviePlayer.isFullscreen)) {
                self.topBar.alpha = 0.f;
            }
            self.bottomBar.alpha = 0.f;
        }                completion:^(BOOL finished) {
            _showing = NO;
            if(completion)
                completion();
        }];
    } else {
        if(completion)
            completion();
    }
}


- (void)makeTwoBars {
    //top bar
    //    _topBar.color = _barColor;
    _topBar = [[UIView alloc] init];
    _topBar.alpha = 0.f;
    [self addSubview:_topBar];

    //bottom bar
    _bottomBar = [[UIView alloc] init];
//    _bottomBar.color = _barColor;
    _bottomBar.alpha = 1.f;
    [self addSubview:_bottomBar];

    // Top bar items
    self.durationSlider = [[UISlider alloc] init];
    self.timeElapsedLabel = [[UILabel alloc] init];
    self.timeRemainingLabel = [[UILabel alloc] init];
    [_topBar addSubview:self.durationSlider];
    [_topBar addSubview:self.timeElapsedLabel];
    [_topBar addSubview:self.timeRemainingLabel];

    [self makeCancelAndChooseButtons];

    //static stuff
    self.playPauseButton = [[UIButton alloc] init];
    [_bottomBar addSubview:self.playPauseButton];

    [self setTwoBars:_topBar withBottomBar:_bottomBar withDurationSlider:self.durationSlider withTimeElapsedLabel:self.timeElapsedLabel withTimeRemainingLabel:self.timeRemainingLabel withPlayPauseButton:self.playPauseButton moviePause:nil moviePlay:nil];

}

- (void)setTwoBars:(UIView *)topBar withBottomBar:(UIView *)bottomBar withDurationSlider:(UISlider *)durationSlider withTimeElapsedLabel:(UILabel *)timeElapsedLabel withTimeRemainingLabel:(UILabel *)timeRemainingLabel withPlayPauseButton:(UIButton *)playPauseButton moviePause:(NSString *)moviePause moviePlay:(NSString *)moviePlay {

    self.topBar = topBar;
    self.bottomBar = bottomBar;
    self.durationSlider = durationSlider;
    self.timeElapsedLabel = timeElapsedLabel;
    self.timeRemainingLabel = timeRemainingLabel;

    self.playPauseButton = playPauseButton;

//    NSString * moviePause =@"";
//    NSString * moviePlay =@"";
    [self setupTwoBars:moviePause withMoviePlay:moviePlay];
}

- (void)setupTwoBars:(NSString *)moviePause withMoviePlay:(NSString *)moviePlay {

    self.durationSlider.value = 0.f;
    self.durationSlider.continuous = YES;

    [self.durationSlider addTarget:self action:@selector(durationSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.durationSlider addTarget:self action:@selector(durationSliderTouchBegan:) forControlEvents:UIControlEventTouchDown];
    [self.durationSlider addTarget:self action:@selector(durationSliderTouchEnded:) forControlEvents:UIControlEventTouchUpInside];
    [self.durationSlider addTarget:self action:@selector(durationSliderTouchEnded:) forControlEvents:UIControlEventTouchUpOutside];


    self.timeElapsedLabel.backgroundColor = [UIColor clearColor];
    self.timeElapsedLabel.font = [UIFont systemFontOfSize:12.f];
    self.timeElapsedLabel.textColor = [UIColor lightTextColor];
    self.timeElapsedLabel.textAlignment = NSTextAlignmentRight;
    self.timeElapsedLabel.text = @"0:00";
    self.timeElapsedLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    self.timeElapsedLabel.layer.shadowRadius = 1.f;
    self.timeElapsedLabel.layer.shadowOffset = CGSizeMake(1.f, 1.f);
    self.timeElapsedLabel.layer.shadowOpacity = 0.8f;


    self.timeRemainingLabel.backgroundColor = [UIColor clearColor];
    self.timeRemainingLabel.font = [UIFont systemFontOfSize:12.f];
    self.timeRemainingLabel.textColor = [UIColor lightTextColor];
    self.timeRemainingLabel.textAlignment = NSTextAlignmentLeft;
    self.timeRemainingLabel.text = @"0:00";
    self.timeRemainingLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    self.timeRemainingLabel.layer.shadowRadius = 1.f;
    self.timeRemainingLabel.layer.shadowOffset = CGSizeMake(1.f, 1.f);
    self.timeRemainingLabel.layer.shadowOpacity = 0.8f;



    //static stuff
//    [self.playPauseButton setImage:[UIImage imageNamed:@"moviePause.png"] forState:UIControlStateNormal];
//    [self.playPauseButton setImage:[UIImage imageNamed:@"moviePlay.png"] forState:UIControlStateSelected];    
    [self.playPauseButton setImage:[UIImage imageNamed:moviePause] forState:UIControlStateNormal];
    [self.playPauseButton setImage:[UIImage imageNamed:moviePlay] forState:UIControlStateSelected];
    [self.playPauseButton setSelected:_moviePlayer.playbackState == MPMoviePlaybackStatePlaying ? NO : YES];
    [self.playPauseButton addTarget:self action:@selector(playPausePressed:) forControlEvents:UIControlEventTouchUpInside];
//    self.playPauseButton.delegate = self;
}

- (void)makeCancelAndChooseButtons {
//cancel button
//    _cancelButton = [[ALButton alloc] init];
//    [_cancelButton setTitle:@"Choose" forState:UIControlStateNormal];
//    _cancelButton.delegate = self;
//    _cancelButton.backgroundColor = [UIColor clearColor];
//    [_cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_cancelButton addTarget:self action:@selector(choosePressed:) forControlEvents:UIControlEventTouchUpInside];
//
//    //use button
//    _chooseButton = [[ALButton alloc] init];
//    [_chooseButton setTitle:@"Cancel" forState:UIControlStateNormal];
//    _chooseButton.delegate = self;
//    _chooseButton.backgroundColor = [UIColor clearColor];
//    [_chooseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_chooseButton addTarget:self action:@selector(cancelPressed:) forControlEvents:UIControlEventTouchUpInside];
//
//    [_bottomBar addSubview:_cancelButton];
//    [_bottomBar addSubview:_chooseButton];
}


- (void)layoutTwoBarItems {
//common sizes
    CGFloat paddingBetweenLabelsAndSlider = 10.f;
    CGFloat sliderHeight = 34.f; //default height

    CGFloat seekWidth = 100.f;
    CGFloat seekHeight = 50.f;

    CGFloat playWidth = 18.f * 2;
    CGFloat playHeight = 22.f * 2;

    CGFloat labelWidth = 30.f;

    //top bar
    self.topBar.frame = CGRectMake(0, 0, self.frame.size.width, self.barHeight);

    //bottom bar
    self.bottomBar.frame = CGRectMake(0, self.frame.size.height - self.barHeight, self.frame.size.width, self.barHeight);
    self.playPauseButton.frame = CGRectMake(CGRectGetWidth(self.bottomBar.frame) / 2 - playWidth / 2, self.barHeight / 2 - playHeight / 2, playWidth, playHeight);
    self.cancelButton.frame = CGRectMake(CGRectGetWidth(self.bottomBar.frame) - seekWidth, self.barHeight / 2 - seekHeight / 2 + 1.f, seekWidth, seekHeight);
    self.chooseButton.frame = CGRectMake(0, self.barHeight / 2 - seekHeight / 2 + 1.f, seekWidth, seekHeight);

    //duration slider
    self.timeElapsedLabel.frame = CGRectMake(10, 0, labelWidth, self.barHeight);
    self.timeRemainingLabel.frame = CGRectMake(CGRectGetWidth(self.topBar.frame) - labelWidth - 10, 0, labelWidth, self.barHeight);

    CGFloat timeRemainingX = self.timeRemainingLabel.frame.origin.x;
    CGFloat timeElapsedX = self.timeElapsedLabel.frame.origin.x;
    CGFloat sliderWidth = ((timeRemainingX - paddingBetweenLabelsAndSlider) - (timeElapsedX + self.timeElapsedLabel.frame.size.width + paddingBetweenLabelsAndSlider));

    self.durationSlider.frame = CGRectMake(timeElapsedX + self.timeElapsedLabel.frame.size.width + paddingBetweenLabelsAndSlider,
            self.barHeight / 2 - sliderHeight / 2,
            sliderWidth,
            sliderHeight);

    if(self.state == ALMoviePlayerControlsStateLoading) {
//        _activityIndicator.center = self.center;
    }
}


@end
