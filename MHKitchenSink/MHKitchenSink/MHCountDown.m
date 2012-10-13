//
//  MHCountDown.m
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHCountDown.h"

#define CD_SECOND  1
#define CD_MINUTE (CD_SECOND * 60)
#define CD_HOUR   (CD_MINUTE * 60)
#define CD_DAY    (CD_HOUR * 24)

@interface MHCountDown()

@property (strong, nonatomic) NSTimer*     timer;
@property (strong, nonatomic) NSDate*      date;
@property (strong) id<MHCountDownDelegate> delegate;

@property (assign) BOOL       ifutureTime;
@property (assign) NSUInteger idays;
@property (assign) NSUInteger ihours;
@property (assign) NSUInteger iminutes;
@property (assign) NSUInteger iseconds;

@end

@implementation MHCountDown


#pragma mark - public methods and properties


+(MHCountDown *) countdownForDate:(NSDate*) date delegate:(id<MHCountDownDelegate>)delegate
{
   MHCountDown* countDown = [[MHCountDown alloc] init];
   countDown.delegate     = delegate;
   countDown.date         = date;
   
   [countDown startTimer];
   
   return countDown;
}

-(BOOL)       futureTime { return self.ifutureTime; }
-(NSUInteger) days       { return self.idays; }
-(NSUInteger) hours      { return self.ihours; }
-(NSUInteger) minutes    { return self.iminutes; }
-(NSUInteger) seconds    { return self.iseconds; }

-(NSString*) description
{
   NSString* isFuture = self.futureTime ? @"YES" : @"NO";
   return [NSString stringWithFormat:@"Future = %@, %ud%02uh%02um%02us", isFuture, self.days, self.hours, self.minutes, self.seconds];
}

#pragma mark -

#pragma mark - private methods

-(void) startTimer
{
   [self updateTimer: self];
   self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector(updateTimer:) userInfo: nil repeats: YES];
}

-(void) stopTimer
{
   
}

-(void) updateTimer:(id) timerId
{
   NSTimeInterval timeDiff = [self.date timeIntervalSinceNow];
   
   if (timeDiff > 0.0)
   {
      self.ifutureTime = YES;
   }
   else
   {
      timeDiff *= -1;
   }
   
   self.idays    = timeDiff / CD_DAY;
   timeDiff -= (self.days * CD_DAY);
   
   self.ihours   = timeDiff / CD_HOUR;
   timeDiff -= (self.hours * CD_HOUR);
   
   self.iminutes = timeDiff / CD_MINUTE;
   timeDiff -= (self.minutes * CD_MINUTE);
   
   self.iseconds = timeDiff;
   
   if (self.delegate)
   {
      if (![self.delegate updatedCountDown: self])
      {
         [self.timer invalidate];
      }
   }
}

#pragma mark -

@end
