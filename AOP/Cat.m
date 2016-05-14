//
//  Cat.m
//  AOP
//
//  Created by LH'sMacbook on 16/5/9.
//  Copyright © 2016年 LH. All rights reserved.
//

#import "Cat.h"

@implementation Cat
@synthesize name;
@synthesize type;

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


@end
