//
//  ItemEntry.h
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemEntry : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *itemDescription;
@property BOOL verify;

- (instancetype)initWithName:(NSString *)name
                withLocation:(NSString *)location
             withDescription:(NSString *)description
                  withVerify:(BOOL)verify;

@end
