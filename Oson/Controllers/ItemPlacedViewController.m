//
//  ItemPlacedViewController.m
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import "ItemPlacedViewController.h"

@interface ItemPlacedViewController ()

@property (nonatomic, strong) UIButton *confirm;

@end

@implementation ItemPlacedViewController

- (instancetype)initWithItem:(ItemEntry *)item {
    self = [super init];
    if (self) {
        // Customization
        _itemOrdered = item;
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
    CGFloat buttonHeight = 30;
    CGFloat paddingFromTop = 20;
    CGFloat heightOfItemName = 34;
    CGFloat leftMargin = 20;
    CGFloat rightMargin = 20;
    CGFloat bottomMargin = 20;

    [self setupConfirmWithPosition:CGPointMake(leftMargin,
                                               windowHeight - buttonHeight - bottomMargin)
                          withSize:CGSizeMake(windowWidth - leftMargin - rightMargin,
                                              buttonHeight)
                         withColor:[UIColor greenColor]];
}

- (void)setupSubview:(UIView *)view
        withPosition:(CGPoint)position
            withSize:(CGSize)size
           withColor:(UIColor *)color {
    view.frame = CGRectMake(position.x, position.y, size.width, size.height);
    view.backgroundColor = color;
    [self.view addSubview:view];
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

- (IBAction)confirmOrder:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
