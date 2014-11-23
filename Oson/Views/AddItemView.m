//
//  AddItemView.m
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import "AddItemView.h"

@implementation AddItemView

- (instancetype)initWithFrame:(CGRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        _confirm = [[UIButton alloc] init];
        _cancel = [[UIButton alloc] init];
        _itemName = [[UITextField alloc] init];
        _itemDescription = [[UITextField alloc] init];
        _location = [[UITextField alloc] init];
        _verify = [[UILabel alloc] init];
        _verifyButton = [[UIButton alloc] init];
        
        CGFloat baseWidth = frameRect.size.width;
        CGFloat baseHeight = frameRect.size.height;
        CGFloat buttonLength = 100;
        NSLog(@"%@", NSStringFromCGRect(frameRect));
        
        [self initializeView:_confirm
                withPosition:CGPointMake(baseWidth / 2, baseHeight / 2)
                   withFrame:CGSizeMake(buttonLength, buttonLength)];
        _confirm.backgroundColor = [UIColor greenColor];
        [_confirm setTitle:@"CONFIRM" forState:UIControlStateNormal];
        NSLog(@"%@", NSStringFromCGRect(_confirm.frame));
        
        [self initializeView:_cancel
                withPosition:CGPointMake(baseWidth - buttonLength,
                                         baseHeight - buttonLength)
                   withFrame:CGSizeMake(buttonLength, buttonLength)];
        _cancel.backgroundColor = [UIColor redColor];
        [_cancel setTitle:@"CANCEL" forState:UIControlStateNormal];
        
        [self initializeView:_itemName
                withPosition:CGPointMake(0, 40)
                   withFrame:CGSizeMake(baseWidth, 20)];
        _itemName.backgroundColor = [UIColor grayColor];
        
        [self initializeView:_itemDescription
                withPosition:CGPointMake(0, 60)
                   withFrame:CGSizeMake(baseWidth, 20)];
        _itemDescription.backgroundColor = [UIColor whiteColor];
        
        [self initializeView:_location
                withPosition:CGPointMake(0, 80)
                   withFrame:CGSizeMake(baseWidth, 20)];
        _location.backgroundColor = [UIColor blueColor];
        
        [self initializeView:_verify
                withPosition:CGPointMake(0, 100)
                   withFrame:CGSizeMake(baseWidth - 50, 20)];
        _verify.backgroundColor = [UIColor redColor];
        
        [self initializeView:_verifyButton
                withPosition:CGPointMake(0, 120)
                   withFrame:CGSizeMake(buttonLength, buttonLength)];
        _verifyButton.backgroundColor = [UIColor greenColor];
        [_verifyButton setTitle:@"VERIFY" forState:UIControlStateNormal];
    }
    return self;
}

- (void)initializeView:(UIView *)view
          withPosition:(CGPoint)position
             withFrame:(CGSize)size
{
    CGRect frame = CGRectMake(position.x, position.y, size.width, size.height);
    [view setFrame:frame];
    [self addSubview:view];
}

@end
