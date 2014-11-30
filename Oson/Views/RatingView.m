//
//  RatingView.m
//  Oson
//
//  Created by Yujun Cho on 11/30/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import "RatingView.h"
#import <QuartzCore/QuartzCore.h>

@interface RatingView ()

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIView *ratingHolder;
@property (nonatomic, strong) UIButton *firstStar;
@property (nonatomic, strong) UIButton *secondStar;
@property (nonatomic, strong) UIButton *thirdStar;
@property (nonatomic, strong) UIButton *fourthStar;
@property (nonatomic, strong) UIButton *fifthStar;

@end

@implementation RatingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _title = [[UILabel alloc] init];
        _ratingHolder = [[UIView alloc] init];
        _firstStar = [[UIButton alloc] init];
        _secondStar = [[UIButton alloc] init];
        _thirdStar = [[UIButton alloc] init];
        _fourthStar = [[UIButton alloc] init];
        _fifthStar = [[UIButton alloc] init];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutTitle];
    [self layoutRating];
}

- (void)layoutTitle {
    self.title.text = @"Rate Your Courier!";
    self.title.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    
    CGFloat paddingFromTop = 10;
    self.title.frame = CGRectMake(0,
                                  paddingFromTop,
                                  self.frame.size.width,
                                  30);
    [self addSubview:self.title];
}

- (void)layoutRating {
    CGFloat paddingFromTop = self.title.frame.size.height + self.title.frame.origin.y;
    self.ratingHolder.frame = CGRectMake(0,
                                         paddingFromTop,
                                         self.frame.size.width,
                                         self.frame.size.height - paddingFromTop);
    
    [self.ratingHolder addSubview:self.firstStar];
    [self.ratingHolder addSubview:self.secondStar];
    [self.ratingHolder addSubview:self.thirdStar];
    [self.ratingHolder addSubview:self.fourthStar];
    [self.ratingHolder addSubview:self.fifthStar];
    
    CGFloat leftMargin = 5;
    CGFloat starSize = (self.ratingHolder.frame.size.width / 5) - (leftMargin * 2);
    CGFloat starYPos = (self.ratingHolder.frame.size.height / 2) - (starSize / 2);
    CGFloat starXPos = self.ratingHolder.frame.size.width / 5;
    self.firstStar.backgroundColor = [UIColor whiteColor];
    self.secondStar.backgroundColor = [UIColor whiteColor];
    self.thirdStar.backgroundColor = [UIColor whiteColor];
    self.fourthStar.backgroundColor = [UIColor whiteColor];
    self.fifthStar.backgroundColor = [UIColor whiteColor];
    
    self.firstStar.layer.borderWidth = 3.0f;
    self.firstStar.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.secondStar.layer.borderWidth = 3.0f;
    self.secondStar.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.thirdStar.layer.borderWidth = 3.0f;
    self.thirdStar.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.fourthStar.layer.borderWidth = 3.0f;
    self.fourthStar.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.fifthStar.layer.borderWidth = 3.0f;
    self.fifthStar.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.firstStar.frame = CGRectMake(leftMargin,
                                      starYPos,
                                      starSize,
                                      starSize);
    self.secondStar.frame = CGRectMake(starXPos + leftMargin,
                                      starYPos,
                                      starSize,
                                      starSize);
    
    self.thirdStar.frame = CGRectMake(starXPos * 2 + leftMargin,
                                      starYPos,
                                      starSize,
                                      starSize);
    self.fourthStar.frame = CGRectMake(starXPos * 3 + leftMargin,
                                      starYPos,
                                      starSize,
                                      starSize);
    self.fifthStar.frame = CGRectMake(starXPos * 4 + leftMargin,
                                      starYPos,
                                      starSize,
                                      starSize);
    
    [self.firstStar addTarget:self 
                       action:@selector(firstStar:)
             forControlEvents:UIControlEventTouchDown];
    [self.secondStar addTarget:self
                       action:@selector(secondStar:)
             forControlEvents:UIControlEventTouchDown];
    [self.thirdStar addTarget:self
                       action:@selector(thirdStar:)
             forControlEvents:UIControlEventTouchDown];
    [self.fourthStar addTarget:self
                       action:@selector(fourthStar:)
             forControlEvents:UIControlEventTouchDown];
    [self.fifthStar addTarget:self
                       action:@selector(fifthStar:)
             forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:self.ratingHolder];
}

#pragma mark - Handle buttons

- (IBAction)firstStar:(id)sender {
    self.firstStar.backgroundColor = [UIColor lightGrayColor];
    self.secondStar.backgroundColor = [UIColor whiteColor];
    self.thirdStar.backgroundColor = [UIColor whiteColor];
    self.fourthStar.backgroundColor = [UIColor whiteColor];
    self.fifthStar.backgroundColor = [UIColor whiteColor];
}

- (IBAction)secondStar:(id)sender {
    self.firstStar.backgroundColor = [UIColor lightGrayColor];
    self.secondStar.backgroundColor = [UIColor lightGrayColor];
    self.thirdStar.backgroundColor = [UIColor whiteColor];
    self.fourthStar.backgroundColor = [UIColor whiteColor];
    self.fifthStar.backgroundColor = [UIColor whiteColor];
}

- (IBAction)thirdStar:(id)sender {
    self.firstStar.backgroundColor = [UIColor lightGrayColor];
    self.secondStar.backgroundColor = [UIColor lightGrayColor];
    self.thirdStar.backgroundColor = [UIColor lightGrayColor];
    self.fourthStar.backgroundColor = [UIColor whiteColor];
    self.fifthStar.backgroundColor = [UIColor whiteColor];
}

- (IBAction)fourthStar:(id)sender {
    self.firstStar.backgroundColor = [UIColor lightGrayColor];
    self.secondStar.backgroundColor = [UIColor lightGrayColor];
    self.thirdStar.backgroundColor = [UIColor lightGrayColor];
    self.fourthStar.backgroundColor = [UIColor lightGrayColor];
    self.fifthStar.backgroundColor = [UIColor whiteColor];
}

- (IBAction)fifthStar:(id)sender {
    self.firstStar.backgroundColor = [UIColor lightGrayColor];
    self.secondStar.backgroundColor = [UIColor lightGrayColor];
    self.thirdStar.backgroundColor = [UIColor lightGrayColor];
    self.fourthStar.backgroundColor = [UIColor lightGrayColor];
    self.fifthStar.backgroundColor = [UIColor lightGrayColor];
}

@end
