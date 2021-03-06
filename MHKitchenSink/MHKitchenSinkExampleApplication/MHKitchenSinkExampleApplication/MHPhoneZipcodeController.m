//
//  MHSimpleUSPhoneNumberController.m
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHPhoneZipcodeController.h"

@interface MHPhoneZipcodeController ()

@end

@implementation MHPhoneZipcodeController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
   self.phoneDelegate             = [[MHSimpleUSPhoneNumberTextFieldDelegate alloc] initAndAttach:self.phoneNumber];
   self.phoneDelegate.delegate    = self;
   self.phoneDelegate.phoneNumber = @"555.222.4567";
   
   [self.plus4picker setSelectedSegmentIndex:mhZipCodeNoPlus4];
   self.zipcodeDelegate          = [[MHZipCodeTextFieldDelegate alloc] initAndAttach:self.zipCode withOption:mhZipCodeNoPlus4];
   self.zipcodeDelegate.delegate = self;
   self.zipcodeDelegate.zipCode  = @"12345";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) phoneNumberFieldHasChanged:(MHSimpleUSPhoneNumberTextFieldDelegate *)phoneNumberDelegate
{
   BOOL isValid = phoneNumberDelegate.isValid;
   
   if (isValid && (self.phoneColorSwitch.on))
   {
      self.phoneNumber.backgroundColor = [UIColor greenColor];
   }
   else
   {
      self.phoneNumber.backgroundColor = [UIColor whiteColor];
   }
}

-(void) zipcodeFieldHasChanged:(MHZipCodeTextFieldDelegate*) zipcodeDelegate
{
   BOOL isValid = zipcodeDelegate.isValid;
   
   if (isValid && (self.zipColorSwitch.on))
   {
      self.zipCode.backgroundColor = [UIColor greenColor];
   }
   else
   {
      self.zipCode.backgroundColor = [UIColor whiteColor];
   }
}

- (IBAction)plus4OptionChanged:(id)sender
{
   self.zipcodeDelegate.zipCodeOptions = [self.plus4picker selectedSegmentIndex];
}

- (IBAction)phoneNumberColorToggle:(id)sender
{
   [self phoneNumberFieldHasChanged:self.phoneDelegate];
}

- (IBAction)zipCodeColorToggle:(id)sender
{
   [self zipcodeFieldHasChanged:self.zipcodeDelegate];
}
@end
