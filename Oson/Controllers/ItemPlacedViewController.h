//
//  ItemPlacedViewController.h
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemEntry.h"

@interface ItemPlacedViewController : UIViewController

@property (nonatomic, strong) ItemEntry *itemOrdered;

- (instancetype)initWithItem:(ItemEntry *)item;

@end
