//
//  CreditCard.h
//  CreditCardForm
//
//  Created by lriviere on 27/10/2015.
//  Copyright © 2015 Ludovic Riviere. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreditCard : NSObject

@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *holderName;
@property (nonatomic, copy) NSString *expiresAt;    // MM/YY
@property (nonatomic, copy) NSString *cvv;

@end
