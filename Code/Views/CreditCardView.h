//
//  CreditCardView.h
//  CreditCardForm
//
//  Created by Ludovic Riviere on 28/10/2015.
//  Copyright (c) 2015 Ludovic Riviere. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CreditCard;

@interface CreditCardView : UIView

@property (nonatomic, weak) IBOutlet UIView *frontView;
@property (nonatomic, weak) IBOutlet UIView *backView;

@property (nonatomic, weak) IBOutlet UITextField *numberField;
@property (nonatomic, weak) IBOutlet UITextField *holderNameField;
@property (nonatomic, weak) IBOutlet UITextField *expiresField;
@property (nonatomic, weak) IBOutlet UITextField *cvvField;

@property (nonatomic, assign, readonly) BOOL frontSide;
@property (nonatomic, weak) CreditCard *creditCard;

- (void)unregisterObserver;

- (void)flipToBackSide;
- (void)flipToFrontSide;

@end
