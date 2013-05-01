//
//  MHCurrencyController.m
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/14/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHCurrencyController.h"

@interface MHCurrencyController ()

@end

@implementation MHCurrencyController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
   
   self.currencyDelegate      = [[MHCurrencyTextFieldDelegate alloc] initAndAttach:self.currencyField];
   self.currencyDelegate.delegate    = self;
   self.currencyDelegate.zeroIsBlank = YES;
   self.currencyDelegate.currency =  0; //250.50;
   
}

-(void) currencyFieldHasChanged:(MHCurrencyTextFieldDelegate *)currencyDelegate
{
   NSLog(@"CURRENCY field has changed");
}

-(void) editingCurrencyField:(MHCurrencyTextFieldDelegate *)currencyDelegate nonZeorValue:(BOOL)nonZero {
   NSLog(@"editing currency field non-zero is %@", nonZero ? @"YES" : @"NO");
}

- (IBAction)wholeNumberChange:(id)sender
{
   self.currencyDelegate.wholeNumbers = self.currencySwitch.on;
}
@end
