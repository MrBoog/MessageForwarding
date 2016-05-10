//
//  Dog.m
//  AOP
//
//  Created by LH'sMacbook on 16/5/9.
//  Copyright © 2016年 LH. All rights reserved.
//

#import "Dog.h"

@implementation Dog
@synthesize name;
@synthesize type;

- (void)run
{
    NSLog(@"-------> %s %@",__func__,self.class);
}

@end
