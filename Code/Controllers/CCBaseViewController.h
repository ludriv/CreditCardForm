//
//  CCBaseViewController.h
//  CreditCardForm
//
//  Created by Ludovic Riviere on 26/10/2015.
//  Copyright (c) 2015 Ludovic Riviere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCBaseViewController : UIViewController

#pragma mark - Keyboard events

- (void)keyboardWillShowChanges:(CGRect)keyboardRect;
- (void)keyboardWillHideChanges;

@end
