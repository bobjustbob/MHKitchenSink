//
//  MHCountDownTests.m
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHCountDownTests.h"
#import "MHCountDown.h"

#define TEST_SECOND      1
#define TEST_MINUTE      (TEST_SECOND * 60)
#define TEST_HOUR        (TEST_MINUTE * 60)
#define TEST_DAY         (TEST_HOUR * 24)

@implementation MHCountDownTests

- (void)setUp
{
   [super setUp];
   
   // Set-up code here.
}

- (void)tearDown
{
   // Tear-down code here.
   
   [super tearDown];
}

- (void)testFuture
{
   NSInteger testDays     = 4 * TEST_DAY;
   NSInteger testHours    = 8 * TEST_HOUR;
   NSInteger testMinutes  = 30 * TEST_MINUTE;
   NSInteger testSeconds  = 10;
   NSInteger testInterval = testDays + testHours + testMinutes + testSeconds;
   
   NSDate* testDate = [NSDate dateWithTimeIntervalSinceNow:testInterval];
   
   MHCountDown* countDown = [MHCountDown countdownForDate:testDate];
   
   NSString* testString = [countDown description];
   STAssertTrue([testString isEqualToString:@"Future = YES, 4:08:30.09"], @"Future time time");
   
   NSLog(@"%@", testString);
}


- (void)testPast
{
   NSInteger testDays     = 4 * TEST_DAY;
   NSInteger testHours    = 8 * TEST_HOUR;
   NSInteger testMinutes  = 30 * TEST_MINUTE;
   NSInteger testSeconds  = 10;
   NSInteger testInterval = (testDays + testHours + testMinutes + testSeconds) * -1;
   
   NSDate* testDate = [NSDate dateWithTimeIntervalSinceNow:testInterval];
   
   MHCountDown* countDown = [MHCountDown countdownForDate:testDate];
   
   NSString* testString = [countDown description];
   STAssertTrue([testString isEqualToString:@"Future = NO, 4:08:30.10"], @"Future time time");
   
   NSLog(@"%@", testString);
}

@end
