//
//  MHSimpleUSPhoneNumberController.h
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../MHKitchenSink/MHSimpleUSPhoneNumberEditor.h"

@interface MHSimpleUSPhoneNumberController : UIViewController <MHSimpleUSPhoneNumberEditorDelegate>

@property (weak, nonatomic)   IBOutlet UITextField*                   phoneNumber;
@property (strong, nonatomic) MHSimpleUSPhoneNumberTextFieldDelegate* phoneDelegate;

@end
