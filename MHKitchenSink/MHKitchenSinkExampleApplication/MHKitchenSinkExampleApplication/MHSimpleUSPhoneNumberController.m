//
//  MHSimpleUSPhoneNumberController.m
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHSimpleUSPhoneNumberController.h"

@interface MHSimpleUSPhoneNumberController ()

@end

@implementation MHSimpleUSPhoneNumberController

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
   self.phoneDelegate = [[MHSimpleUSPhoneNumberTextFieldDelegate alloc] initAndAttach:self.phoneNumber];
   self.phoneDelegate.delegate = self;
   [self.phoneDelegate setPhoneNumber:@"555.222.4567"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) phoneNumberFieldHasChanged:(MHSimpleUSPhoneNumberTextFieldDelegate *)phoneNumberDelegate
{
   BOOL isValid = phoneNumberDelegate.isValid;
   
   if (isValid)
   {
      self.phoneNumber.backgroundColor = [UIColor greenColor];
   }
   else
   {
      self.phoneNumber.backgroundColor = [UIColor whiteColor];
   }
}

@end
