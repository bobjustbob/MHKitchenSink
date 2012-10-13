//
//  MHSimpleUSPhoneNumberController.h
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../MHKitchenSink/MHSimpleUSPhoneNumberEditor.h"
#import "../../MHKitchenSink/MHZipCodeTextFieldDelegate.h"

@interface MHPhoneZipcodeController : UIViewController <MHSimpleUSPhoneNumberEditorDelegate, MHZipCodeEditorDelegate>

@property (weak, nonatomic)   IBOutlet UITextField*                   phoneNumber;
@property (strong, nonatomic) MHSimpleUSPhoneNumberTextFieldDelegate* phoneDelegate;

@property (weak, nonatomic)   IBOutlet UITextField*                   zipCode;
@property (strong, nonatomic) MHZipCodeTextFieldDelegate*             zipcodeDelegate;

@property (weak, nonatomic) IBOutlet UISegmentedControl *plus4picker;
- (IBAction)plus4OptionChanged:(id)sender;

@end
