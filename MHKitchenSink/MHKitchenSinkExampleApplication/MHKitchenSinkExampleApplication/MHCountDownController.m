//
//  MHCountDownController.m
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/13/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHCountDownController.h"

@interface MHCountDownController ()

@end

@implementation MHCountDownController

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
}

-(void) viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
   
   NSDate* now = [NSDate date];
   NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components: NSYearCalendarUnit fromDate:now];
   
   dateComponents.day = 1;
   dateComponents.month = 1;
   dateComponents.year += 1;
   
   NSDate* futureDate = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
   
   self.cdFuture = [MHCountDown countdownForDate:futureDate delegate:self];
}

-(void) viewDidDisappear:(BOOL)animated {
   [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) updatedCountDown:(MHCountDown *)countdown
{
   if (countdown.futureTime)
   {
      self.countdownFuture.text = [countdown description];
   }
   else
   {
      self.countdownFuture.text = @"HAPPY NEW YEARS!!!!!";
   }
   // turn off timer when new years in no longer in the future
   return countdown.futureTime;
}

@end
