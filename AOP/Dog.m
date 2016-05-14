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

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)run
{
    NSLog(@"-------> %s %@",__func__,self.class);
}

- (void)sleep
{

}

- (void)doEat:(NSString *)food
{
    NSLog(@"%@",self);
}

- (void)doMulticastDelegateTest
{
    NSLog(@"-------> %s",__func__);
}
@end
