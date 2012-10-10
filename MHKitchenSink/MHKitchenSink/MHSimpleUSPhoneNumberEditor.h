//
//  MHSimpleUSPhoneNumberEditor.h
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MHSimpleUSPhoneNumberTextFieldDelegate;

@protocol MHSimpleUSPhoneNumberEditorDelegate

-(void) phoneNumberFieldHasChanged:(MHSimpleUSPhoneNumberTextFieldDelegate*) phoneNumberDelegate;

@end

//
// TextFieldDelegate - based internal class does all the heavy lifting
//
@interface MHSimpleUSPhoneNumberTextFieldDelegate : NSObject <UITextFieldDelegate>

@property (weak, nonatomic)             UITextField*                            textField;
@property (assign, readonly, nonatomic) BOOL                                    isValid;
@property (weak, nonatomic)             id<MHSimpleUSPhoneNumberEditorDelegate> delegate;

-(id)    initAndAttach:(UITextField*) textField;
-(void)  attach:(UITextField*) textField;
-(void)  setPhoneNumber:(NSString*) phoneNumber;

@end

