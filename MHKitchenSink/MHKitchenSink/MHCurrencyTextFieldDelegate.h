//
//  MHCurrencyTextFieldDelegate.h
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/14/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MHCurrencyTextFieldDelegate;

@protocol MHCurrencyEditorDelegate

-(void) currencyFieldHasChanged:(MHCurrencyTextFieldDelegate*) currencyDelegate;

@end

//
// TextFieldDelegate - based internal class does all the heavy lifting
//
@interface MHCurrencyTextFieldDelegate : NSObject <UITextFieldDelegate>

@property (weak, nonatomic)             UITextField*                  textField;
@property (assign, readonly, nonatomic) BOOL                          isValid;
@property (assign, nonatomic)           BOOL                          wholeNumbers;
@property (weak, nonatomic)             id<MHCurrencyEditorDelegate>  delegate;
@property (assign, nonatomic)           double                        currency;
@property (readonly, nonatomic)         NSString*                     formattedCurrency;
@property (assign, nonatomic)           double                        minVal;
@property (assign, nonatomic)           double                        maxVal;

-(id)        initAndAttach:(UITextField*) textField;
-(void)      attach:(UITextField*) textField;

@end

