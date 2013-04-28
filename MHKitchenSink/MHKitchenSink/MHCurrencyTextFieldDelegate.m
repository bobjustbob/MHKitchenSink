//
//  MHCurrencyTextFieldDelegate.m
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/14/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHCurrencyTextFieldDelegate.h"

@implementation MHCurrencyTextFieldDelegate

-(id) initAndAttach:(UITextField *)textField
{
   self = [super init];
   [self attach:textField];
   
   return self;
}

-(void) attach:(UITextField *)textField
{
   self.textField  = textField;
   self.textField.delegate = self;
   [self setKeyboardType];
}

-(NSString*) formattedCurrency
{
   return [self doubleToCurrency:self.currency];
}


-(void) setCurrency:(double)currency
{
   _currency = currency;
   self.textField.text = [self doubleToCurrency:currency];
   if (self.delegate)
   {
      [self.delegate currencyFieldHasChanged:self];
   }
}


-(void) setWholeNumbers:(BOOL)wholeNumbers
{
   _wholeNumbers = wholeNumbers;
   [self setKeyboardType];
   self.currency = _currency;
}

-(BOOL) isValid
{
   return YES;
}

#pragma mark -

-(void) setKeyboardType
{
   if (self.wholeNumbers)
   {
      self.textField.keyboardType = UIKeyboardTypeNumberPad;
   }
   else
   {
      self.textField.keyboardType = UIKeyboardTypeDecimalPad;
   }
}

-(double) currencyToDouble:(NSString*) currencyString
{
   double             retVal = 0.0;
   NSNumberFormatter* nf     = [[NSNumberFormatter alloc] init];
   
   [nf setNumberStyle:NSNumberFormatterCurrencyStyle];
   retVal = [[nf numberFromString: currencyString] doubleValue];
   
   return retVal ? retVal : [currencyString doubleValue];
}

-(NSString*) doubleToCurrency:(double) currencyValue
{
   if (!currencyValue && self.zeroIsBlank) { return @""; }
   
   NSNumberFormatter* nf = [[NSNumberFormatter alloc] init];
   
   [nf setNumberStyle:NSNumberFormatterCurrencyStyle];
   
   if (self.wholeNumbers)
   {
      nf.roundingMode          = NSNumberFormatterRoundHalfUp;
      nf.maximumFractionDigits = 0;
   }
   
   return [nf stringFromNumber:[NSNumber numberWithDouble:currencyValue]];
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
   NSString* inputStr =  [self.textField.text stringByReplacingCharactersInRange:range withString:string];
   
   if (self.delegate) {
      [self.delegate editingCurrencyField:self nonZeorValue:[self currencyToDouble:inputStr] > 0.0];
   }
   
   return YES;
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{
   [self setCurrency:[self currencyToDouble:textField.text]];
}


@end
