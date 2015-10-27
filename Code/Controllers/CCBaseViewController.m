//
//  CCBaseViewController.m
//  CreditCardForm
//
//  Created by Ludovic Riviere on 26/10/2015.
//  Copyright (c) 2015 Ludovic Riviere. All rights reserved.
//

#import "CCBaseViewController.h"

@interface CCBaseViewController ()

@end

@implementation CCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupEvents];
}

- (void)setupEvents {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Keyboard events

- (void)keyboardWillShow:(NSNotification *)notification {
    double duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect kbFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    __weak CCBaseViewController *welf = self;
    
    [self keyboardWillShowChanges:kbFrame];
    [UIView animateWithDuration:duration
                     animations:^{
                         [welf.view layoutIfNeeded];
                     }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    double duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    __weak CCBaseViewController *welf = self;
    
    [self keyboardWillHideChanges];
    [UIView animateWithDuration:duration
                     animations:^{
                         [welf.view layoutIfNeeded];
                     }];
}

- (void)keyboardWillShowChanges:(CGRect)keyboardRect {
    
}

- (void)keyboardWillHideChanges {
    
}

@end
