//
//  MHCurrencyController.h
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/14/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../MHKitchenSink/MHCurrencyTextFieldDelegate.h"

@interface MHCurrencyController : UIViewController <MHCurrencyEditorDelegate>

@property (weak, nonatomic) IBOutlet UITextField *currencyField;
@property (weak, nonatomic) IBOutlet UISwitch *currencySwitch;
- (IBAction)wholeNumberChange:(id)sender;

@property (strong, nonatomic) MHCurrencyTextFieldDelegate* currencyDelegate;

@end
