//
//  Test.m
//  AOP
//
//  Created by LH'sMacbook on 16/5/14.
//  Copyright © 2016年 LH. All rights reserved.
//

#import "Test.h"

@interface Test ()
{
    MulticastDelegate <Animal>*_multicastDelegate;
}
@end

@implementation Test

- (instancetype)init
{
    self = [super init];
    if (self) {
        _multicastDelegate = (MulticastDelegate <Animal>*)[[MulticastDelegate alloc] init];
    }
    return self;
}

- (void)test{
    
    //method forwarding
//    [[AnimalProxy sharedInstance] _registerHandlerProtocol:@protocol(Animal) handler:[Dog new]];
//    [[AnimalProxy sharedInstance] run];
    
    [self testMultiDelegate];
}

- (void)testMultiDelegate
{
    Dog *dog = [[Dog alloc] init];
    [_multicastDelegate addDelegate:dog];
    
    Cat *cat = [[Cat alloc] init];
    [_multicastDelegate addDelegate:cat];
    
    
    [_multicastDelegate doMulticastDelegateTest];
}
@end
