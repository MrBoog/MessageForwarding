//
//  AnimalProxy.h
//  AOP
//
//  Created by LH'sMacbook on 16/5/9.
//  Copyright © 2016年 LH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"

@interface AnimalProxy : NSProxy <Animal>
+ (instancetype)sharedInstance;
- (void)_registerHandlerProtocol:(Protocol *)protocol handler:(id)handler;
@end
