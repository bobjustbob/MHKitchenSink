//
//  MHSimpleUSPhoneNumberEditor.m
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHSimpleUSPhoneNumberEditor.h"


@implementation MHSimpleUSPhoneNumberTextFieldDelegate

#define MAX_PHONE_NUMBER_SIZE 10

#pragma mark - public methods

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
   self.textField.keyboardType = UIKeyboardTypeNumberPad;
}

-(void) setPhoneNumber:(NSString *)phoneNumber
{
   NSString* normalizedString = [self stringWithNumbersOnly:phoneNumber maxLen:100];
   self.textField.text = [self normalizeOutput:normalizedString];
   
   if (self.delegate)
   {
      [self.delegate phoneNumberFieldHasChanged:self];
   }
}


-(BOOL) isValid
{
   NSString* rawNumber = [self stringWithNumbersOnly:self.textField.text maxLen:100];
   return rawNumber.length == MAX_PHONE_NUMBER_SIZE;
}

#pragma mark -

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
         // TODO: digits 0 and 4 can only be [2-9]
         if ( ((c == '0') || (c == '1')) &&
             ((i == 0) || (i == 3))
            )
         {
            NSLog(@"first charactor of NPA or NXX cannot be 0 or 1");
         }
         else
         {
            numberString = [numberString stringByAppendingFormat:@"%C", c];
         }
      }
   }
   return numberString;
}


-(NSString*) normalizedInput:(NSString*) normalizedString
{
   normalizedString = [normalizedString stringByReplacingOccurrencesOfString:@"(" withString:@""];
   normalizedString = [normalizedString stringByReplacingOccurrencesOfString:@")" withString:@""];
   normalizedString = [normalizedString stringByReplacingOccurrencesOfString:@" " withString:@""];
   normalizedString = [normalizedString stringByReplacingOccurrencesOfString:@"-" withString:@""];
   normalizedString = [self stringWithNumbersOnly:normalizedString maxLen:MAX_PHONE_NUMBER_SIZE];
   
   return normalizedString;
}

-(NSString*) normalizedInput:(NSRange) range replacementString:(NSString*) string
{
   NSString* normalizedString = [self.textField.text stringByReplacingCharactersInRange:range withString:string];
   return [self normalizedInput:normalizedString];
}

-(NSString*) normalizeOutput:(NSString*) string
{
   NSString*   normalizedString = @"";
   NSUInteger  strLength = [string length];
   
   if (strLength)
   {
      for (int i = 0; i < strLength; i++)
      {
         if (i == 0)       { normalizedString = [normalizedString stringByAppendingString:@"("];}
         else if (i == 3)  { normalizedString = [normalizedString stringByAppendingString:@") "];}
         else if (i == 6)  { normalizedString = [normalizedString stringByAppendingString:@"-"];}
         
         normalizedString = [normalizedString stringByAppendingFormat:@"%C", [string characterAtIndex:i]];
      }
   }
   
   return normalizedString;
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
   NSString* inputStr  = [self normalizedInput:range replacementString:string];
   NSString* outputStr = [self normalizeOutput:inputStr];
   
   self.textField.text = outputStr;
   
   if (self.delegate)
   {
      [self.delegate phoneNumberFieldHasChanged:self];
   }
   
   return NO;
}

@end

