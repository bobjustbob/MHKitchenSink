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
   [MHSimpleUSPhoneNumberTextField class]; // whacky linker issue?
   [self.phoneNumber setPhoneNumber:@"555.123.4567"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
