//
//  Animal.h
//  AOP
//
//  Created by LH'sMacbook on 16/5/9.
//  Copyright © 2016年 LH. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Animal <NSObject>


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;

- (void)run;

@end
