//
//  MHZipCodeTextFieldDelegate.m
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/12/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHZipCodeTextFieldDelegate.h"

@implementation MHZipCodeTextFieldDelegate

#define ZIPCODE_LEN       5
#define ZIPCODE_PLUS4_LEN 4


-(NSString*) stringWithNumbersOnly:(NSString*) string maxLen:(NSUInteger) maxSize;
{
   NSString*  numberString = @"";
   NSCharacterSet* numericSet = [NSCharacterSet decimalDigitCharacterSet];
   NSUInteger strLen = [string length];
   
   for (NSUInteger i = 0; i < strLen; i++)
   {
      if (i >= maxSize) break;
      
      unichar c = [string characterAtIndex:i];
      if ([numericSet characterIsMember:c])
      {
         numberString = [numberString stringByAppendingFormat:@"%C", c];
      }
   }
   return numberString;
}

-(NSString*) normalizeOutput:(NSString*) string
{
   NSString*   normalizedString = @"";
   NSUInteger  strLength = [string length];
   
   if (strLength)
   {
      for (int i = 0; i < strLength; i++)
      {
         if (i == 5)
         {
            normalizedString = [normalizedString stringByAppendingString:@"-"];
         }
         normalizedString = [normalizedString stringByAppendingFormat:@"%C", [string characterAtIndex:i]];
      }
   }
   return normalizedString;
}


-(NSString*) normalizedInput:(NSString*) string
{
   NSString* normalizedString = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
   return [self stringWithNumbersOnly:normalizedString maxLen: self.zipCodeOptions == mhZipCodeNoPlus4 ? ZIPCODE_LEN : (ZIPCODE_LEN + ZIPCODE_PLUS4_LEN)];
}

-(NSString*) normalizedInput:(NSRange) range replacementString:(NSString*) string
{
   NSString* normalizedString = [self.textField.text stringByReplacingCharactersInRange:range withString:string];
   return [self normalizedInput:normalizedString];
}


#pragma mark - property methods

-(NSString*) zipCode
{
   return [self normalizedInput:self.textField.text];
}


-(NSString*) formattedZipCode
{
   return self.textField.text;
}

-(BOOL) isValid
{
   BOOL       valid = NO;
   NSUInteger len   = [self normalizedInput: self.textField.text].length;
   switch (self.zipCodeOptions)
   {
      case mhZipCodeNoPlus4:
         valid = len == ZIPCODE_LEN;
         break;
         
      case mnZipCodePlus4Optional:
         valid = (len == ZIPCODE_LEN) || (len == (ZIPCODE_LEN + ZIPCODE_PLUS4_LEN));
         break;
         
      case mhZipCodePlus4Required:
         valid = len == (ZIPCODE_LEN + ZIPCODE_PLUS4_LEN);
         break;
         
      default:
         break;
   }
   return valid;
}

-(void) setZipCodeOptions:(MHZipCodeOptions)zipCodeOptions
{
   _zipCodeOptions = zipCodeOptions;
   
   [self setZipCode:self.textField.text];
}

#pragma mark -

-(id) initAndAttach:(UITextField*) textField withOption:(MHZipCodeOptions) option;
{
   self = [super init];
   
   if (self)
   {
      [self attach: textField];
      self.zipCodeOptions = option;
   }
   
   return self;
}

-(void)  attach:(UITextField*) textField
{
   self.textField              = textField;
   self.textField.delegate     = self;
   self.textField.keyboardType = UIKeyboardTypeNumberPad;
}

-(void)  setZipCode:(NSString*) zipCode
{
   self.textField.text = [self normalizeOutput: [self normalizedInput:zipCode]];
   if (self.delegate)
   {
      [self.delegate zipcodeFieldHasChanged:self];
   }
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
   NSString* inputStr  = [self normalizedInput:range replacementString:string];
   NSString* outputStr = [self normalizeOutput:inputStr];
   
   self.textField.text = outputStr;
   
   if (self.delegate)
   {
      [self.delegate zipcodeFieldHasChanged:self];
   }
   
   return NO;
}

@end
