//
//  LoginViewController.m
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()

@property (nonatomic, strong) UILabel *appName;
@property (nonatomic, strong) UITextField *username;
@property (nonatomic, strong) UITextField *password;
@property (nonatomic, strong) UIButton *login;

@end

@implementation LoginViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _appName = [[UILabel alloc] init];
        _username = [[UITextField alloc] init];
        _password = [[UITextField alloc] init];
        _login = [[UIButton alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupAllSubviews];
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc]
                                     initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Handle Touches

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

#pragma mark - Setup Views

- (void)setupAllSubviews {
    CGFloat windowWidth = self.view.frame.size.width;
    CGFloat windowHeight = self.view.frame.size.height;
    CGFloat paddingFromTop = windowHeight / 4;
    CGFloat heightOfAppName = 50;
    CGFloat leftMargin = 50;
    CGFloat rightMargin = 50;
    CGFloat dividerLeftMargin = 20;
    
    [self setupAppNameWithPosition:CGPointMake(0, paddingFromTop)
                          withSize:CGSizeMake(windowWidth, heightOfAppName)
                         withColor:[UIColor clearColor]];
    
    CGFloat paddingFromAppName = 20;
    paddingFromTop += heightOfAppName + paddingFromAppName;
    CGFloat textFieldHeight = 50;
    CGFloat textFieldWidth = windowWidth - leftMargin - rightMargin;
    
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];
    [self setupUsernameWithPosition:CGPointMake(leftMargin, paddingFromTop)
                           withSize:CGSizeMake(textFieldWidth, textFieldHeight)
                          withColor:[UIColor clearColor]];
    
    paddingFromTop += textFieldHeight;
    
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];
    [self setupPasswordWithPosition:CGPointMake(leftMargin, paddingFromTop)
                           withSize:CGSizeMake(textFieldWidth, textFieldHeight)
                          withColor:[UIColor clearColor]];
    
    paddingFromTop += textFieldHeight;
    [self addDivider:CGPointMake(dividerLeftMargin, paddingFromTop)];
    CGFloat paddingFromBottomDivider = 15;
    paddingFromTop += paddingFromBottomDivider;
    CGFloat buttonHeight = 30;
    CGFloat buttonWidth = windowWidth - leftMargin - rightMargin;
    
    [self setupLoginWithPosition:CGPointMake(leftMargin, paddingFromTop)
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

- (void)setupAppNameWithPosition:(CGPoint)position
                        withSize:(CGSize)size
                       withColor:(UIColor *)color {
    self.appName.text = @"Oson";
    self.appName.textAlignment = NSTextAlignmentCenter;
    self.appName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:54];
    [self setupSubview:self.appName
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupUsernameWithPosition:(CGPoint)position
                         withSize:(CGSize)size
                        withColor:(UIColor *)color {
    self.username.placeholder = @"Username";
    self.username.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    [self setupSubview:self.username
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupPasswordWithPosition:(CGPoint)position
                         withSize:(CGSize)size
                        withColor:(UIColor *)color {
    self.password.placeholder = @"Password";
    self.password.secureTextEntry = YES;
    self.password.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    [self setupSubview:self.password
          withPosition:position
              withSize:size
             withColor:color];
}

- (void)setupLoginWithPosition:(CGPoint)position
                        withSize:(CGSize)size
                       withColor:(UIColor *)color {
    [self.login setTitle:@"Log In" forState:UIControlStateNormal];
    [self.login setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.login.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
    [self setupSubview:self.login
          withPosition:position
              withSize:size
             withColor:color];
    [self.login addTarget:self
                     action:@selector(confirmLogin:)
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

- (IBAction)confirmLogin:(id)sender {
    
    if ([self.username.text isEqualToString:@""] || [self.password.text isEqualToString:@""]) {
        UIAlertView *incompleteAlert = [[UIAlertView alloc] initWithTitle:@"Incorrect Information"
                                                                  message:@"Your username or \npassword is incorrect."
                                                                 delegate:nil
                                                        cancelButtonTitle:@"Got it!"
                                                        otherButtonTitles:nil, nil];
        [incompleteAlert show];
    } else if ([self.delegate respondsToSelector:@selector(userDidLogin)]) {
        [self.delegate userDidLogin];
    }
}

@end
