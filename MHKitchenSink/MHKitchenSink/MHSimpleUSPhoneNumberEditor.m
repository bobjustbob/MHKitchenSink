//
//  MHSimpleUSPhoneNumberEditor.m
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHSimpleUSPhoneNumberEditor.h"


@implementation MHSimpleUSPhoneNumberTextField

- (id)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
   if (self)
   {
      // Initialization code
      self.delegate = self;
   }
   return self;
}

#define MAX_PHONE_NUMBER_SIZE 10

-(void) setPhoneNumber:(NSString *)phoneNumber
{
   if (!self.delegate)
   {
      self.delegate = self;
      self.keyboardType = UIKeyboardTypeNumberPad;
   }
   NSString* normalizedString = [self stringWithNumbersOnly:phoneNumber maxLen:100];
   self.text = [self normalizeOutput:normalizedString];
}


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
   NSString* normalizedString = [self.text stringByReplacingCharactersInRange:range withString:string];
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
   
   self.text = outputStr;
   
   return NO;
}

@end

//
//
#pragma mark - EXTERNAL INTERFACE IMPLEMENTATION BEGINS HERE
//
//

//
// private stuff
//
@interface MHSimpleUSPhoneNumberEditor()
@property (strong, nonatomic) MHSimpleUSPhoneNumberTextField* phoneField;
@end


@implementation MHSimpleUSPhoneNumberEditor

#pragma - property-related methods
-(MHSimpleUSPhoneNumberTextField*) phoneField
{
   if (!_phoneField)
   {
      _phoneField = [[MHSimpleUSPhoneNumberTextField alloc] initWithFrame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
      _phoneField.delegate = _phoneField;
   }
   return _phoneField;
}

-(void) setPhoneNumber:(NSString *)phoneNumber
{
   [self.phoneField setPhoneNumber:phoneNumber];
}

-(NSString*) phoneNumber
{
   return self.phoneField.text;
}

#pragma mark -

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
       if (!_phoneField)
       {
          _phoneField = [[MHSimpleUSPhoneNumberTextField alloc] initWithFrame: CGRectMake(0, 0, frame.size.width, frame.size.height)];
          _phoneField.delegate = _phoneField;
       }
    }
    return self;
}

-(void) layoutSubviews
{
   self.phoneField.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

@end
