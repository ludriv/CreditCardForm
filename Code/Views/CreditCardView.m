//
//  CreditCardView.m
//  CreditCardForm
//
//  Created by Ludovic Riviere on 28/10/2015.
//  Copyright (c) 2015 Ludovic Riviere. All rights reserved.
//

#import "CreditCardView.h"
#import "CreditCard.h"

@implementation CreditCardView

NSTimeInterval const kCCFlipAnimationDuration = 0.5;

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _frontSide = YES;
    }
    return self;
}

- (void)setCreditCard:(CreditCard *)creditCard {
    _creditCard = creditCard;
    
    [self cc_setup];
}

- (void)cc_setup
{
    self.userInteractionEnabled = NO;
    
    [self.creditCard addObserver:self
                      forKeyPath:@"number"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
    
    [self.creditCard addObserver:self
                      forKeyPath:@"holderName"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
    
    [self.creditCard addObserver:self
                      forKeyPath:@"expiresAt"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
    
    [self.creditCard addObserver:self
                      forKeyPath:@"cvv"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    
    id newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    if ([keyPath isEqualToString:@"number"]) {
        self.numberField.text = newValue;
    } else if ([keyPath isEqualToString:@"holderName"]) {
        self.holderNameField.text = newValue;
    } else if ([keyPath isEqualToString:@"expiresAt"]) {
        self.expiresField.text = newValue;
    } else if ([keyPath isEqualToString:@"cvv"]) {
        self.cvvField.text = newValue;
    }
    
}

- (void)unregisterObserver
{
    [self.creditCard removeObserver:self forKeyPath:@"number"];
    [self.creditCard removeObserver:self forKeyPath:@"holderName"];
    [self.creditCard removeObserver:self forKeyPath:@"expiresAt"];
    [self.creditCard removeObserver:self forKeyPath:@"cvv"];
}

#pragma mark - Flip methods

- (void)flipToBackSide
{
    if (_frontSide == NO) {
        return;
    }
    [UIView transitionWithView:self
                      duration:kCCFlipAnimationDuration
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        self.backView.hidden = NO;
                        self.frontView.hidden = YES;
                    }
                    completion:^(BOOL finished) {
                        _frontSide = NO;
                    }];
}

- (void)flipToFrontSide
{
    if (_frontSide == YES) {
        return;
    }
    [UIView transitionWithView:self
                      duration:kCCFlipAnimationDuration
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        self.backView.hidden = YES;
                        self.frontView.hidden = NO;
                    }
                    completion:^(BOOL finished) {
                        _frontSide = YES;
                    }];
}

@end
