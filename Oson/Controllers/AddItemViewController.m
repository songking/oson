//
//  AddItemViewController.m
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@property (nonatomic, strong) UITextField *itemName;
@property (nonatomic, strong) UITextField *location;
@property (nonatomic, strong) UITextField *itemDescription;
@property (nonatomic, strong) UILabel *verify;
@property (nonatomic, strong) UIButton *verifyButton;
@property (nonatomic, strong) UIButton *confirm;
@property (nonatomic, strong) UIButton *cancel;

@end

@implementation AddItemViewController

#pragma mark - Initialize class

- (instancetype)init {
    self = [super init];
    if (self) {
        // Customization
        _itemName = [[UITextField alloc] init];
        _location = [[UITextField alloc] init];
        _itemDescription = [[UITextField alloc] init];
        _verify = [[UILabel alloc] init];
        _verifyButton = [[UIButton alloc] init];
        _confirm = [[UIButton alloc] init];
        _cancel = [[UIButton alloc] init];
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
                          withColor:[UIColor lightGrayColor]];

    CGFloat textfieldUpperPadding = 10;
    paddingFromTop += heightOfItemName + textfieldUpperPadding;
    CGFloat heightOfLocation = 20;
    
    [self setupLocationwithPosition:CGPointMake(leftMargin, paddingFromTop)
                           withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                               heightOfLocation)
                          withColor:[UIColor clearColor]];
    
    paddingFromTop += heightOfLocation + textfieldUpperPadding;
    CGFloat heightOfVerify = 20;
    
    [self setupVerifyWithPosition:CGPointMake(leftMargin, paddingFromTop)
                         withSize:CGSizeMake(windowWidth / 2,
                                             heightOfVerify)
                        withColor:[UIColor clearColor]];
    
    [self setupVerifyButtonWithPosition:CGPointMake(windowWidth - (buttonSize / 2) - rightMargin,
                                                    paddingFromTop)
                               withSize:CGSizeMake(buttonSize / 2, buttonSize / 2)
                              withColor:[UIColor greenColor]];
    
    paddingFromTop += heightOfVerify + textfieldUpperPadding;
    CGFloat heightOfItemDescription = 20;
    
    [self setupItemDescriptionwithPosition:CGPointMake(leftMargin, paddingFromTop)
                                  withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                                      heightOfItemDescription)
                                 withColor:[UIColor clearColor]];
    
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

- (void)setupItemDescriptionwithPosition:(CGPoint)position
                                withSize:(CGSize)size
                               withColor:(UIColor *)color {
    [self setupSubview:self.itemDescription
          withPosition:position
              withSize:size
             withColor:color];
    [self.itemDescription setPlaceholder:@"Additional details"];
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
}


- (void)setupConfirmWithPosition:(CGPoint)position
                        withSize:(CGSize)size
                       withColor:(UIColor *)color {
    [self setupSubview:self.confirm
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupCancelWithPosition:(CGPoint)position
                        withSize:(CGSize)size
                       withColor:(UIColor *)color {
    [self setupSubview:self.cancel
          withPosition:position
              withSize:size
             withColor:color];
}

@end
