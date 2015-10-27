//
//  CCFormViewController.h
//  CreditCardForm
//
//  Created by Ludovic Riviere on 26/10/2015.
//  Copyright (c) 2015 Ludovic Riviere. All rights reserved.
//

#import "CCBaseViewController.h"

@protocol CCFormViewControllerDelegate;
@class CreditCard;

@interface CCFormViewController : CCBaseViewController

@property (nonatomic, weak) id<CCFormViewControllerDelegate> ccDelegate;

@end

@protocol CCFormViewControllerDelegate <NSObject>

- (void)ccDidFinishEditingCreditCard:(CreditCard *)creditCard
                      fromController:(UIViewController *)controller;

@end
