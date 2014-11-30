//
//  ItemPlacedViewController.m
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import "ItemPlacedViewController.h"
#import "RatingView.h"

@interface ItemPlacedViewController ()

@property (nonatomic, strong) UIButton *cancel;
@property (nonatomic, strong) UILabel *estimatedTime;
@property (nonatomic, strong) UILabel *verified;
@property (nonatomic, strong) RatingView *rating;
@property (nonatomic, strong) UIImageView *courierPicture;
@property (nonatomic, strong) UILabel *courierStatus;

@end

@implementation ItemPlacedViewController

- (instancetype)initWithItem:(ItemEntry *)item {
    self = [super init];
    if (self) {
        // Customization
        _itemOrdered = item;
        _cancel = [[UIButton alloc] init];
        _estimatedTime = [[UILabel alloc] init];
        _verified = [[UILabel alloc] init];
        _rating = [[RatingView alloc] init];
        _courierPicture = [[UIImageView alloc] init];
        _courierStatus = [[UILabel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupAllSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup Views

- (void)setupAllSubviews {
    CGFloat windowWidth = self.view.frame.size.width;
    CGFloat windowHeight = self.view.frame.size.height;
    CGFloat buttonHeight = 30;
    CGFloat paddingFromTop = 20;
    CGFloat leftMargin = 30;
    CGFloat rightMargin = 30;
    CGFloat bottomMargin = 20;
    CGFloat dividerLeftMargin = 20;
    CGFloat sizeOfCourierPicture = 50;
    CGFloat courierHeaderHeight = 80;
    CGFloat topPaddingOfCourierPicture = (courierHeaderHeight - sizeOfCourierPicture) / 2;
    
    [self setupCourierPictureWithPosition:CGPointMake(leftMargin,
                                                      paddingFromTop + topPaddingOfCourierPicture)
                                 withSize:CGSizeMake(sizeOfCourierPicture, sizeOfCourierPicture)
                                withColor:[UIColor clearColor]];
    
    CGFloat leftPaddingFromCourierPicture = 20;
    CGFloat totalLeftPaddingForCourierStatus = leftMargin +
                                                    sizeOfCourierPicture +
                                                    leftPaddingFromCourierPicture;
    [self setupCourierStatusWithPosition:CGPointMake(totalLeftPaddingForCourierStatus,
                                                     paddingFromTop)
                                withSize:CGSizeMake(windowWidth -
                                                        totalLeftPaddingForCourierStatus -
                                                        rightMargin,
                                                    courierHeaderHeight)
                               withColor:[UIColor clearColor]];
    
    paddingFromTop += courierHeaderHeight;
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];


    CGFloat heightOfEstimated = 50;
    [self setupEstimatedWithPosition:CGPointMake(leftMargin, paddingFromTop)
                            withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                                heightOfEstimated)
                           withColor:[UIColor clearColor]];
    
    paddingFromTop += heightOfEstimated;
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];
    
    CGFloat heightOfVerified = 50;
    [self setupVerifiedWithPosition:CGPointMake(leftMargin, paddingFromTop)
                           withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                               heightOfVerified)
                          withColor:[UIColor clearColor]];
    
    paddingFromTop += heightOfVerified;
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];
    
    CGFloat paddingFromCancelButton = 30;
    CGFloat heightOfRating = windowHeight -
                                bottomMargin -
                                buttonHeight -
                                paddingFromCancelButton -
                                paddingFromTop;
    
    [self setupRatingWithPosition:CGPointMake(leftMargin, paddingFromTop)
                         withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                             heightOfRating)
                        withColor:[UIColor clearColor]];
    
    CGFloat paddingFromItemDescription = 20;
    paddingFromTop += heightOfRating + paddingFromItemDescription;
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];
    CGFloat cancelButtonHeight = 30;
    CGFloat buttonWidth = windowWidth - leftMargin - rightMargin;
    
    [self setupCancelWithPosition:CGPointMake(leftMargin,
                                               windowHeight - buttonHeight - bottomMargin)
                          withSize:CGSizeMake(buttonWidth, cancelButtonHeight)
                         withColor:[UIColor clearColor]];
}

- (void)setupSubview:(UIView *)view
        withPosition:(CGPoint)position
            withSize:(CGSize)size
           withColor:(UIColor *)color {
    view.frame = CGRectMake(position.x, position.y, size.width, size.height);
    view.backgroundColor = color;
    [self.view addSubview:view];
}

- (void)setupCourierPictureWithPosition:(CGPoint)position
                               withSize:(CGSize)size
                              withColor:(UIColor *)color {
    self.courierPicture.clipsToBounds = YES;
    self.courierPicture.layer.cornerRadius = size.height / 2;
    self.courierPicture.contentMode = UIViewContentModeScaleAspectFill;
    self.courierPicture.clipsToBounds = YES;
    UIImage *courierImage = [UIImage imageNamed:@"courierPhoto.png"];
    [self.courierPicture setImage:courierImage];
    [self setupSubview:self.courierPicture
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupCourierStatusWithPosition:(CGPoint)position
                               withSize:(CGSize)size
                              withColor:(UIColor *)color {
    [self.courierStatus setFont:[UIFont fontWithName:@"HelveticaNeue-Light"
                                                size:18]];
    self.courierStatus.text = @"Milo received your order";
    [self setupSubview:self.courierStatus
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupEstimatedWithPosition:(CGPoint)position
                               withSize:(CGSize)size
                              withColor:(UIColor *)color {
    [self.estimatedTime setFont:[UIFont fontWithName:@"HelveticaNeue-Light"
                                                size:18]];
    self.estimatedTime.text = @"Estimated Delivery Time: 20mins";
    [self setupSubview:self.estimatedTime
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupVerifiedWithPosition:(CGPoint)position
                          withSize:(CGSize)size
                         withColor:(UIColor *)color {
    [self.verified setFont:[UIFont fontWithName:@"HelveticaNeue-Light"
                                           size:18]];
    self.verified.text = @"Verified: Not Yet";
    [self setupSubview:self.verified
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupRatingWithPosition:(CGPoint)position
                         withSize:(CGSize)size
                        withColor:(UIColor *)color {
    [self setupSubview:self.rating
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupCancelWithPosition:(CGPoint)position
                        withSize:(CGSize)size
                       withColor:(UIColor *)color {
    [self.cancel setTitle:@"Cancel Order" forState:UIControlStateNormal];
    [self.cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.cancel.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
    [self setupSubview:self.cancel
          withPosition:position
              withSize:size
             withColor:color];
    [self.cancel addTarget:self
                     action:@selector(cancelOrder:)
           forControlEvents:UIControlEventTouchDown];
}

- (void)addDivider:(CGPoint)position {
    UIImageView *dividerHolder = [[UIImageView alloc] initWithFrame:CGRectMake(position.x,
                                                                               position.y,
                                                                               self.view.frame.size.width,
                                                                               2)];
    UIImage *divider = [UIImage imageNamed:@"Divider.png"];
    dividerHolder.image = divider;
    [dividerHolder sizeToFit];
    [self.view addSubview:dividerHolder];
}

#pragma mark - Button Handling

- (IBAction)cancelOrder:(id)sender {
    [self alertOKCancelAction];
}

- (void)alertOKCancelAction {

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancel Order"
                                                    message:@"Are you sure you want to cancel?"
                                                   delegate:self
                                          cancelButtonTitle:@"No"
                                          otherButtonTitles:@"Yes", nil];
    alert.tag = 1;
    [alert show];
}

- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alert.tag == 1)
    {
        if(buttonIndex == alert.cancelButtonIndex)
        {
            
        }
        else
        {
            [self dismissViewControllerAnimated:NO completion:nil];
        }
    }
}

@end
