//
//  ViewController.m
//  AOP
//
//  Created by LH'sMacbook on 16/5/9.
//  Copyright © 2016年 LH. All rights reserved.
//

#import "ViewController.h"
#import "AnimalProxy.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //method forwarding
    [[AnimalProxy sharedInstance] _registerHandlerProtocol:@protocol(Animal) handler:[Cat new]];
    [[AnimalProxy sharedInstance] run];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
