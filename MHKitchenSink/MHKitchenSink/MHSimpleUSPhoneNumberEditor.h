//
//  MHSimpleUSPhoneNumberEditor.h
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

//
// TextFieldDelegate - based internal class does all the heavy lifting
//
@interface MHSimpleUSPhoneNumberTextField : UITextField <UITextFieldDelegate>

-(void) setPhoneNumber:(NSString*) phoneNumber;

@end

@interface MHSimpleUSPhoneNumberEditor : UIView

@property (strong, nonatomic)  NSString* phoneNumber;
@property (assign, nonatomic)  BOOL      isValid;
@property (assign, nonatomic)  BOOL      strongConforming;

@end
