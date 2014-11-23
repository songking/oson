//
//  ItemEntry.m
//  Oson
//
//  Created by Yujun Cho on 11/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

#import "ItemEntry.h"

@implementation ItemEntry

- (instancetype)init {
    self = [self initWithName:@""
                 withLocation:@""
              withDescription:@""
                   withVerify:YES];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                withLocation:(NSString *)location
             withDescription:(NSString *)description
                  withVerify:(BOOL)verify {
    self = [super init];
    if (self) {
        _name = name;
        _location = location;
        _itemDescription = description;
        _verify = verify;
    }
    return self;
}

@end
