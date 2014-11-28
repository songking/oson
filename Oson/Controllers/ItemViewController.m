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
@property (nonatomic, strong) UIButton *verifyButton;
@property (nonatomic, strong) UIButton *verifyView;
@property (nonatomic, strong) UIButton *order;
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
        _verifyButton = [[UIButton alloc] init];
        _verifyView = [[UIButton alloc] init];
        _order = [[UIButton alloc] init];
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
    CGFloat paddingFromTop = 20;
    CGFloat heightOfItemName = 75;
    CGFloat leftMargin = 30;
    CGFloat rightMargin = 30;
    CGFloat bottomMargin = 20;
    CGFloat dividerLeftMargin = 20;
    
    [self setupItemNamewithPosition:CGPointMake(0, paddingFromTop)
                           withSize:CGSizeMake(windowWidth, heightOfItemName)
                          withColor:[UIColor clearColor]];
    
    paddingFromTop += heightOfItemName;
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];
    

    CGFloat heightOfLocation = 50;
    
    [self setupLocationwithPosition:CGPointMake(leftMargin, paddingFromTop)
                           withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                               heightOfLocation)
                          withColor:[UIColor clearColor]];
    
    CGFloat textfieldUpperPadding = 0;
    paddingFromTop += heightOfLocation + textfieldUpperPadding;
    CGFloat heightOfVerify = 50;
    CGFloat verifyButtonSize = 20;
    
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];
    [self setupVerifyButtonWithPosition:CGPointMake(leftMargin, paddingFromTop)
                               withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                                   heightOfVerify)
                              withColor:[UIColor clearColor]];
    
    [self setupVerifyViewWithPosition:CGPointMake(windowWidth - verifyButtonSize - rightMargin,
                                                    paddingFromTop + 15)
                             withSize:CGSizeMake(verifyButtonSize, verifyButtonSize)
                            withColor:[UIColor greenColor]];
    
    paddingFromTop += heightOfVerify + textfieldUpperPadding;
    CGFloat heightOfItemDescriptionTitle = 50;
    
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];
    [self setupItemDescriptionTitleWithPosition:CGPointMake(leftMargin, paddingFromTop)
                                       withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                                           heightOfItemDescriptionTitle)
                                      withColor:[UIColor clearColor]];
    
    CGFloat buttonHeight = 30;
    CGFloat buttonWidth = windowWidth - leftMargin - rightMargin;
    paddingFromTop += heightOfItemDescriptionTitle;
    CGFloat paddingFromConfirmButton = 30;
    CGFloat heightOfItemDescription = windowHeight -
                                        bottomMargin -
                                        buttonHeight -
                                        paddingFromConfirmButton -
                                        paddingFromTop;
    
    [self setupItemDescriptionwithPosition:CGPointMake(leftMargin, paddingFromTop)
                                  withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                                      heightOfItemDescription)
                                 withColor:[UIColor colorWithWhite:0.90 alpha:1]];
    
    CGFloat paddingFromItemDescription = 20;
    paddingFromTop += heightOfItemDescription + paddingFromItemDescription;
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];
    
    [self setupOrderWithPosition:CGPointMake(leftMargin,
                                               windowHeight - buttonHeight - bottomMargin)
                          withSize:CGSizeMake(buttonWidth, buttonHeight)
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

- (void)setupItemNamewithPosition:(CGPoint)position
                         withSize:(CGSize)size
                        withColor:(UIColor *)color {
    [self.itemName setPlaceholder:@"Item Name"];
    [self.itemName setTextAlignment:NSTextAlignmentCenter];
    self.itemName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:28];
    [self setupSubview:self.itemName
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupLocationwithPosition:(CGPoint)position
                         withSize:(CGSize)size
                        withColor:(UIColor *)color {
    [self.location setPlaceholder:@"Set Location"];
    self.location.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    [self setupSubview:self.location
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupItemDescriptionTitleWithPosition:(CGPoint)position
                                     withSize:(CGSize)size
                                    withColor:(UIColor *)color {
    [self.itemDescriptionTitle setText:@"Additional Details"];
    self.itemDescriptionTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    [self setupSubview:self.itemDescriptionTitle
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupItemDescriptionwithPosition:(CGPoint)position
                                withSize:(CGSize)size
                               withColor:(UIColor *)color {
    self.itemDescription.clipsToBounds = YES;
    self.itemDescription.layer.cornerRadius = 10.0f;
    self.itemDescription.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    [self setupSubview:self.itemDescription
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupVerifyButtonWithPosition:(CGPoint)position
                       withSize:(CGSize)size
                      withColor:(UIColor *)color {
    [self.verifyButton setTitle:@"Verify" forState:UIControlStateNormal];
    self.verifyButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    [self.verifyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.verifyButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.verifyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self setupSubview:self.verifyButton
          withPosition:position
              withSize:size
             withColor:color];
    [self.verifyButton addTarget:self
                          action:@selector(toggleVerify:)
                forControlEvents:UIControlEventTouchDown];
}

- (void)setupVerifyViewWithPosition:(CGPoint)position
                             withSize:(CGSize)size
                            withColor:(UIColor *)color {
    [self setupSubview:self.verifyView
          withPosition:position
              withSize:size
             withColor:color];
    [self.verifyView addTarget:self
                          action:@selector(toggleVerify:)
                forControlEvents:UIControlEventTouchDown];
}


- (void)setupOrderWithPosition:(CGPoint)position
                        withSize:(CGSize)size
                       withColor:(UIColor *)color {
    [self.order setTitle:@"Place Order" forState:UIControlStateNormal];
    [self.order setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.order.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
    [self setupSubview:self.order
          withPosition:position
              withSize:size
             withColor:color];
    [self.order addTarget:self
                     action:@selector(confirmOrder:)
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

- (IBAction)toggleVerify:(id)sender {
    if (self.verifyToggle) {
        self.verifyToggle = NO;
        [self.verifyView setBackgroundColor:[UIColor redColor]];
    } else {
        self.verifyToggle = YES;
        [self.verifyView setBackgroundColor:[UIColor greenColor]];
    }
}

- (IBAction)confirmOrder:(id)sender {
    if ([self.itemName.text isEqualToString:@""] || [self.location.text isEqualToString:@""]) {
        UIAlertView *incompleteAlert = [[UIAlertView alloc] initWithTitle:@"Missing Information"
                                                                  message:@"You have left the item \nname or location empty."
                                                                 delegate:nil
                                                        cancelButtonTitle:@"Got it!"
                                                        otherButtonTitles:nil, nil];
        [incompleteAlert show];
    } else {
        ItemEntry *itemToOrder = [[ItemEntry alloc] initWithName:self.itemName.text
                                                    withLocation:self.location.text
                                                 withDescription:self.itemDescription.text
                                                      withVerify:self.verifyToggle];
    
        // Present ItemPlacedViewController
        ItemPlacedViewController *ipvc = [[ItemPlacedViewController alloc] initWithItem:itemToOrder];
        [self presentViewController:ipvc animated:NO completion:nil];
        self.itemName.text = @"";
        self.location.text = @"";
        self.itemDescription.text = @"";
        self.verifyToggle = YES;
        [self.verifyView setBackgroundColor:[UIColor greenColor]];
    }
}

@end