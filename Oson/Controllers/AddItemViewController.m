//
//  AddItemViewController.m
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import "AddItemViewController.h"
#import "AddItemView.h"

@interface AddItemViewController ()

@property (nonatomic, strong) AddItemView *currentView;

@end

@implementation AddItemViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        // Customization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
