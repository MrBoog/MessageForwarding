//
//  AnimalProxy.m
//  AOP
//
//  Created by LH'sMacbook on 16/5/9.
//  Copyright © 2016年 LH. All rights reserved.
//

#import "AnimalProxy.h"
#import <objc/runtime.h>


@interface AnimalProxy ()
@property (nonatomic,strong) NSMutableDictionary *selHandlerDict;
@end



@implementation AnimalProxy
@synthesize name;
@synthesize type;

//NSProxy does not implement -init, so we do not call [super init].
- (instancetype)init{
    _selHandlerDict = [NSMutableDictionary dictionary];
    return self;
}

+ (instancetype)sharedInstance {
    
    static AnimalProxy *_sharedProxy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedProxy = [[AnimalProxy alloc] init];
    });
    return _sharedProxy;
}

- (void)_registerHandlerProtocol:(Protocol *)protocol handler:(id)handler {
    
    unsigned int numberOfMethods = 0;
    
    
    struct objc_method_description *methods = protocol_copyMethodDescriptionList(protocol,
                                                                                 NO,//isRequiredMethod
                                                                                 YES,
                                                                                 &numberOfMethods);
    
    for (unsigned int i = 0; i < numberOfMethods; i++) {
        
        struct objc_method_description method = methods[i];
        NSString *methodNameStr = NSStringFromSelector(method.name);
        
        //Key:methodName value:Target
        [_selHandlerDict setValue:handler forKey:methodNameStr];
    }
}

/*
 * When an object is sent a message which it does not implement, it is given a chance to respond through the -methodSignatureForSelector: and -forwardInvocation: methods.
 * -methodSignatureForSelector: must return the NSMethodSignature associated with the selector.
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    
    NSString *methodNameStr = NSStringFromSelector(sel);
    id target = [_selHandlerDict objectForKey:methodNameStr];
    
    if (target && [target respondsToSelector:sel]) {
        
        return [target methodSignatureForSelector:sel];
    } else {
        
        // This causes a crash...
        //        return [super methodSignatureForSelector:sel];
        return [[self class] instanceMethodSignatureForSelector:@selector(doNothing)];
    }
}

//-forwardInvocation: is then given the opportunity to send the message to the correct object.
- (void)forwardInvocation:(NSInvocation *)invocation {
    
    SEL sel = invocation.selector;
    NSString *methodNameStr = NSStringFromSelector(sel);
    id target = [_selHandlerDict objectForKey:methodNameStr];
    
    if (target && [target respondsToSelector:sel])
    {
        [invocation invokeWithTarget:target];
    } else {
        
        // This causes a crash...
        //        [super forwardInvocation:invocation];
        [self doNothing];
    }
}

- (void)doNothing{
    NSLog(@"-------> %s",__func__);
}
@end
