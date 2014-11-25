//
//  ItemViewController.m
//  Oson
//
//  Created by Yujun Cho on 11/25/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import "ItemViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ItemEntry.h"
#import "ItemPlacedViewController.h"

@interface ItemViewController ()

@property (nonatomic, strong) UITextField *itemName;
@property (nonatomic, strong) UITextField *location;
@property (nonatomic, strong) UITextView *itemDescription;
@property (nonatomic, strong) UILabel *itemDescriptionTitle;
@property (nonatomic, strong) UILabel *verify;
@property (nonatomic, strong) UIButton *verifyButton;
@property (nonatomic, strong) UIButton *confirm;
@property (nonatomic, strong) UIButton *cancel;
@property BOOL verifyToggle;

@end

@implementation ItemViewController

#pragma mark - Initialize class

- (instancetype)init {
    self = [super init];
    if (self) {
        // Customization
        _itemName = [[UITextField alloc] init];
        _location = [[UITextField alloc] init];
        _itemDescription = [[UITextView alloc] init];
        _itemDescriptionTitle = [[UILabel alloc] init];
        _verify = [[UILabel alloc] init];
        _verifyButton = [[UIButton alloc] init];
        _confirm = [[UIButton alloc] init];
        _cancel = [[UIButton alloc] init];
        _verifyToggle = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
    CGFloat buttonSize = 50;
    CGFloat paddingFromTop = 20;
    CGFloat heightOfItemName = 34;
    CGFloat leftMargin = 20;
    CGFloat rightMargin = 20;
    CGFloat bottomMargin = 20;
    
    [self setupItemNamewithPosition:CGPointMake(0, paddingFromTop)
                           withSize:CGSizeMake(windowWidth, heightOfItemName)
                          withColor:[UIColor clearColor]];
    
    CGFloat textfieldUpperPadding = 10;
    paddingFromTop += heightOfItemName + textfieldUpperPadding;
    CGFloat heightOfLocation = 20;
    
    [self setupLocationwithPosition:CGPointMake(leftMargin, paddingFromTop)
                           withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                               heightOfLocation)
                          withColor:[UIColor clearColor]];
    
    paddingFromTop += heightOfLocation + textfieldUpperPadding;
    CGFloat heightOfVerify = 20;
    CGFloat verifyButtonSize = heightOfVerify;
    
    [self setupVerifyWithPosition:CGPointMake(leftMargin, paddingFromTop)
                         withSize:CGSizeMake(windowWidth / 2,
                                             heightOfVerify)
                        withColor:[UIColor clearColor]];
    
    [self setupVerifyButtonWithPosition:CGPointMake(windowWidth - verifyButtonSize - rightMargin,
                                                    paddingFromTop)
                               withSize:CGSizeMake(verifyButtonSize, verifyButtonSize)
                              withColor:[UIColor greenColor]];
    
    paddingFromTop += heightOfVerify + textfieldUpperPadding;
    CGFloat heightOfItemDescriptionTitle = 20;
    
    [self setupItemDescriptionTitleWithPosition:CGPointMake(leftMargin, paddingFromTop)
                                       withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                                           heightOfItemDescriptionTitle)
                                      withColor:[UIColor clearColor]];
    
    paddingFromTop += heightOfItemDescriptionTitle;
    CGFloat heightOfItemDescription = windowHeight / 3;
    
    [self setupItemDescriptionwithPosition:CGPointMake(leftMargin, paddingFromTop)
                                  withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                                      heightOfItemDescription)
                                 withColor:[UIColor lightGrayColor]];
    
    [self setupConfirmWithPosition:CGPointMake(windowWidth - buttonSize - rightMargin,
                                               windowHeight - buttonSize - bottomMargin)
                          withSize:CGSizeMake(buttonSize, buttonSize)
                         withColor:[UIColor greenColor]];
    
    [self setupCancelWithPosition:CGPointMake(leftMargin,
                                              windowHeight - buttonSize - bottomMargin)
                         withSize:CGSizeMake(buttonSize, buttonSize)
                        withColor:[UIColor redColor]];
}

- (void)setupSubview:(UIView *)view
        withPosition:(CGPoint)position
            withSize:(CGSize)size
           withColor:(UIColor *)color {
    view.frame = CGRectMake(position.x, position.y, size.width, size.height);
    view.backgroundColor = color;
    [self.view addSubview:view];
}

- (void)setupItemNamewithPosition:(CGPoint)position
                         withSize:(CGSize)size
                        withColor:(UIColor *)color {
    [self setupSubview:self.itemName
          withPosition:position
              withSize:size
             withColor:color];
    [self.itemName setPlaceholder:@"Item Name"];
    [self.itemName setTextAlignment:NSTextAlignmentCenter];
}

- (void)setupLocationwithPosition:(CGPoint)position
                         withSize:(CGSize)size
                        withColor:(UIColor *)color {
    [self setupSubview:self.location
          withPosition:position
              withSize:size
             withColor:color];
    [self.location setPlaceholder:@"Set Location"];
}

- (void)setupItemDescriptionTitleWithPosition:(CGPoint)position
                                     withSize:(CGSize)size
                                    withColor:(UIColor *)color {
    [self setupSubview:self.itemDescriptionTitle
          withPosition:position
              withSize:size
             withColor:color];
    [self.itemDescriptionTitle setText:@"Additional Details"];
}

- (void)setupItemDescriptionwithPosition:(CGPoint)position
                                withSize:(CGSize)size
                               withColor:(UIColor *)color {
    [self setupSubview:self.itemDescription
          withPosition:position
              withSize:size
             withColor:color];
    self.itemDescription.clipsToBounds = YES;
    self.itemDescription.layer.cornerRadius = 10.0f;
}

- (void)setupVerifyWithPosition:(CGPoint)position
                       withSize:(CGSize)size
                      withColor:(UIColor *)color {
    [self setupSubview:self.verify
          withPosition:position
              withSize:size
             withColor:color];
    [self.verify setText:@"Verify"];
}

- (void)setupVerifyButtonWithPosition:(CGPoint)position
                             withSize:(CGSize)size
                            withColor:(UIColor *)color {
    [self setupSubview:self.verifyButton
          withPosition:position
              withSize:size
             withColor:color];
    [self.verifyButton addTarget:self
                          action:@selector(toggleVerify:)
                forControlEvents:UIControlEventTouchDown];
}


- (void)setupConfirmWithPosition:(CGPoint)position
                        withSize:(CGSize)size
                       withColor:(UIColor *)color {
    [self setupSubview:self.confirm
          withPosition:position
              withSize:size
             withColor:color];
    [self.confirm addTarget:self
                     action:@selector(confirmOrder:)
           forControlEvents:UIControlEventTouchDown];
}

- (void)setupCancelWithPosition:(CGPoint)position
                       withSize:(CGSize)size
                      withColor:(UIColor *)color {
    [self setupSubview:self.cancel
          withPosition:position
              withSize:size
             withColor:color];
    [self.cancel addTarget:self
                    action:@selector(cancelOrder:)
          forControlEvents:UIControlEventTouchDown];
}

#pragma mark - Button Handling

- (IBAction)toggleVerify:(id)sender {
    if (self.verifyToggle) {
        self.verifyToggle = NO;
        [self.verifyButton setBackgroundColor:[UIColor redColor]];
    } else {
        self.verifyToggle = YES;
        [self.verifyButton setBackgroundColor:[UIColor greenColor]];
    }
}

- (IBAction)confirmOrder:(id)sender {
    ItemEntry *itemToOrder = [[ItemEntry alloc] initWithName:self.itemName.text
                                                withLocation:self.location.text
                                             withDescription:self.itemDescription.text
                                                  withVerify:self.verifyToggle];
    // Present ItemPlacedViewController
    ItemPlacedViewController *ipvc = [[ItemPlacedViewController alloc] initWithItem:itemToOrder];
    [self presentViewController:ipvc animated:NO completion:nil];
}

- (IBAction)cancelOrder:(id)sender {
    [self.itemName setText:@""];
    [self.itemDescription setText:@""];
    [self.location setText:@""];
    self.verifyToggle = YES;
    [self.verifyButton setBackgroundColor:[UIColor greenColor]];
}

@end