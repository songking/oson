//
//  LoginViewController.m
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) UILabel *appName;
@property (nonatomic, strong) UITextField *username;
@property (nonatomic, strong) UITextField *password;
@property (nonatomic, strong) UIButton *confirm;
@property (nonatomic, strong) UIButton *cancel;

@end

@implementation LoginViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _appName = [[UILabel alloc] init];
        _username = [[UITextField alloc] init];
        _password = [[UITextField alloc] init];
        _cancel = [[UIButton alloc] init];
        _confirm = [[UIButton alloc] init];
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
    CGFloat buttonSize = 50;
    CGFloat paddingFromTop = windowHeight / 3;
    CGFloat heightOfAppName = 34;
    CGFloat leftMargin = 20;
    CGFloat rightMargin = 20;
    CGFloat bottomMargin = 20;
    
    [self setupAppNameWithPosition:CGPointMake(0, paddingFromTop)
                          withSize:CGSizeMake(windowWidth, heightOfAppName)
                         withColor:[UIColor clearColor]];
    
    CGFloat paddingFromAppName = 20;
    paddingFromTop += heightOfAppName + paddingFromAppName;
    CGFloat textFieldHeight = 20;
    CGFloat textFieldWidth = windowWidth / 2;
    
    [self setupUsernameWithPosition:CGPointMake((windowWidth / 2) - (textFieldWidth / 2),
                                                paddingFromTop)
                           withSize:CGSizeMake(textFieldWidth, textFieldHeight)
                          withColor:[UIColor clearColor]];
    
    CGFloat paddingFromUsername = 5;
    paddingFromTop += textFieldHeight + paddingFromUsername;
    
    [self setupPasswordWithPosition:CGPointMake((windowWidth / 2) - (textFieldWidth / 2),
                                                paddingFromTop)
                           withSize:CGSizeMake(textFieldWidth, textFieldHeight)
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

- (void)setupAppNameWithPosition:(CGPoint)position
                        withSize:(CGSize)size
                       withColor:(UIColor *)color {
    [self setupSubview:self.appName
          withPosition:position
              withSize:size
             withColor:color];
    self.appName.text = @"Oson";
    self.appName.textAlignment = NSTextAlignmentCenter;
}

- (void)setupUsernameWithPosition:(CGPoint)position
                         withSize:(CGSize)size
                        withColor:(UIColor *)color {
    [self setupSubview:self.username
          withPosition:position
              withSize:size
             withColor:color];
    self.username.placeholder = @"Username";
}

- (void)setupPasswordWithPosition:(CGPoint)position
                         withSize:(CGSize)size
                        withColor:(UIColor *)color {
    [self setupSubview:self.password
          withPosition:position
              withSize:size
             withColor:color];
    self.password.placeholder = @"Password";
    self.password.secureTextEntry = YES;
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
    [self.cancel addTarget:self
                    action:@selector(cancelLogin:)
          forControlEvents:UIControlEventTouchDown];
}

#pragma mark - Button Handling

- (IBAction)confirmOrder:(id)sender {
    // Present AddItemViewController
}

- (IBAction)cancelLogin:(id)sender {
    [self.username setText:@""];
    [self.password setText:@""];
}

@end
