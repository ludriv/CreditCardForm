//
//  ViewController.m
//  CreditCardForm
//
//  Created by Ludovic Riviere on 26/10/2015.
//  Copyright (c) 2015 Ludovic Riviere. All rights reserved.
//

#import "ViewController.h"
#import "CCFormViewController.h"

@interface ViewController () <CCFormViewControllerDelegate>

@property (nonatomic, assign) BOOL alreadyShown;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.alreadyShown = NO;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.alreadyShown) {
        return;
    }
    
    CCFormViewController *formViewController = [[CCFormViewController alloc] init];
    formViewController.ccDelegate = self;
    
    [self presentViewController:formViewController
                       animated:YES
                     completion:^{
                         self.alreadyShown = YES;
                     }];
}

#pragma mark - CCFormViewControllerDelegate

- (void)ccDidFinishEditingCreditCard:(CreditCard *)creditCard
                      fromController:(UIViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
