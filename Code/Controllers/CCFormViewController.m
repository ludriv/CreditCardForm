//
//  CCFormViewController.m
//  CreditCardForm
//
//  Created by Ludovic Riviere on 26/10/2015.
//  Copyright (c) 2015 Ludovic Riviere. All rights reserved.
//

#import "CCFormViewController.h"
#import "CreditCard.h"

@interface CCFormViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIView             *footerView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *footerBottom;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *footerHeight;

@property (nonatomic, weak) IBOutlet UIButton           *backButton;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *backButtonWidth;

@property (nonatomic, weak) IBOutlet UIButton           *nextButton;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *nextButtonRight;

@property (nonatomic, weak) IBOutlet UIButton           *doneButton;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *fieldsContainerHeight;
@property (nonatomic, weak) IBOutlet UIScrollView *fieldsContainer;
@property (nonatomic, weak) IBOutlet UILabel      *numberLabel;
@property (nonatomic, weak) IBOutlet UITextField  *numberTextField;
@property (nonatomic, weak) IBOutlet UILabel      *holderLabel;
@property (nonatomic, weak) IBOutlet UITextField  *holderTextField;
@property (nonatomic, weak) IBOutlet UILabel      *expiresLabel;
@property (nonatomic, weak) IBOutlet UITextField  *expiresTextField;
@property (nonatomic, weak) IBOutlet UILabel      *cryptoLabel;
@property (nonatomic, weak) IBOutlet UITextField  *cryptoTextField;

@property (nonatomic, weak) IBOutlet UIView *cardView;

@property (nonatomic) UITextField *focusedTextField;
@property (nonatomic) CreditCard  *creditCard;

@end

@implementation CCFormViewController

CGFloat const CCFooterButtonContainerHeight = 50;
CGFloat const CCFieldsContainerHeight       = 80;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cc_setup];
    [self cc_setupViews];
}

- (void)cc_setup {
    self.creditCard = [[CreditCard alloc] init];
}

- (void)cc_setupViews {
    self.footerHeight.constant = CCFooterButtonContainerHeight;
    self.fieldsContainerHeight.constant = CCFieldsContainerHeight;
    
    self.cardView.layer.cornerRadius = 5.0f;
    [self.view layoutIfNeeded];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear :animated];
    [self.numberTextField becomeFirstResponder];
}

- (void)keyboardWillShowChanges:(CGRect)keyboardRect {
    self.footerBottom.constant = CGRectGetHeight(keyboardRect);
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.focusedTextField = textField;
    
    CGPoint offset;
    if (![textField isEqual:self.numberTextField]) {
        self.backButtonWidth.constant = CGRectGetWidth(self.footerView.bounds) / 2;
        offset = CGPointMake(CGRectGetMidX(textField.frame) - self.fieldsContainer.bounds.size.width / 2, 0);
        
        if ([textField isEqual:self.cryptoTextField]) {
            [self.nextButton setTitle:@"DONE" forState:UIControlStateNormal];
        } else {
            [self.nextButton setTitle:@"NEXT" forState:UIControlStateNormal];
        }
        
    } else {
        self.backButtonWidth.constant = 0;
        offset = CGPointZero;
    }
    
    __block NSArray *labels = @[ self.numberLabel, self.holderLabel, self.expiresLabel, self.cryptoLabel ];
    __block NSArray *fields = @[ self.numberTextField, self.holderTextField, self.expiresTextField, self.cryptoTextField ];
    
    [UIView animateWithDuration:0.25
                     animations:^{
                         
                         [fields enumerateObjectsUsingBlock:^(UITextField *field, NSUInteger idx, BOOL *stop) {
                            
                             UILabel *reflabel = [labels objectAtIndex:idx];
                             
                             if ([field isEqual:self.focusedTextField]) {
                                 field.textColor = reflabel.textColor = [UIColor blackColor];
                             } else {
                                 field.textColor = reflabel.textColor = [UIColor lightGrayColor];
                             }
                             
                         }];
                         
                         [self.fieldsContainer setContentOffset:offset];
                         [self.view layoutIfNeeded];
                     }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.numberTextField]) {
        self.creditCard.number = self.numberTextField.text;
    } else if ([textField isEqual:self.holderTextField]) {
        self.creditCard.holderName = self.holderTextField.text;
    } else if ([textField isEqual:self.expiresTextField]) {
        self.creditCard.expiresAt = self.expiresTextField.text;
    } else if ([textField isEqual:self.cryptoTextField]) {
        self.creditCard.cvv = self.cryptoTextField.text;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *result = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self handleTextChange:result];
    return YES;
}

- (void)handleTextChange:(NSString *)text {
    if ([self.focusedTextField isEqual:self.numberTextField]) {
        
    }
}

#pragma mark - Actions

- (IBAction)backClicked:(id)sender {
    if ([self.focusedTextField isEqual:self.holderTextField]) {
        [self.numberTextField becomeFirstResponder];
    } else if ([self.focusedTextField isEqual:self.expiresTextField]) {
        [self.holderTextField becomeFirstResponder];
    } else if ([self.focusedTextField isEqual:self.cryptoTextField]) {
        [self.expiresTextField becomeFirstResponder];
    }
}

- (IBAction)nextClicked:(id)sender {
    if ([self.focusedTextField isEqual:self.numberTextField]) {
        [self.holderTextField becomeFirstResponder];
    } else if ([self.focusedTextField isEqual:self.holderTextField]) {
        [self.expiresTextField becomeFirstResponder];
    } else if ([self.focusedTextField isEqual:self.expiresTextField]) {
        [self.cryptoTextField becomeFirstResponder];
    }
    
    if ([self.focusedTextField isEqual:self.cryptoTextField]) {
        /** start validation */
    }
}

@end
