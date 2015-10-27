//
//  ViewController.m
//  CreditCardForm
//
//  Created by Ludovic Riviere on 26/10/2015.
//  Copyright (c) 2015 Ludovic Riviere. All rights reserved.
//

#import "ViewController.h"
#import "CCFormViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CCFormViewController *formViewController = [[CCFormViewController alloc] init];
    
    [self presentViewController:formViewController
                       animated:YES
                     completion:nil];
}

@end
