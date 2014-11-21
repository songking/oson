//
//  AddItemView.h
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemView : UIView

@property (nonatomic, strong) UITextField *itemName;
@property (nonatomic, strong) UITextField *location;
@property (nonatomic, strong) UITextField *itemDescription;
@property (nonatomic, strong) UILabel *verify;
@property (nonatomic, strong) UIButton *verifyButton;
@property (nonatomic, strong) UIButton *confirm;
@property (nonatomic, strong) UIButton *cancel;

@end
