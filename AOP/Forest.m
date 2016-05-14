//
//  Forest.m
//  AOP
//
//  Created by LH'sMacbook on 16/5/13.
//  Copyright © 2016年 LH. All rights reserved.
//

#import "Forest.h"

@implementation Forest

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}


- (void)feed
{
    Dog *dog = [[Dog alloc] init];
    [dog doEat:@"bone"];
}

@end
