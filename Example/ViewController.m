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

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    CCFormViewController *formViewController = [[CCFormViewController alloc] init];
    formViewController.ccDelegate = self;
    
    [self presentViewController:formViewController
                       animated:YES
                     completion:nil];
}

#pragma mark - CCFormViewControllerDelegate

- (void)ccDidFinishEditingCreditCard:(CreditCard *)creditCard
                      fromController:(UIViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
