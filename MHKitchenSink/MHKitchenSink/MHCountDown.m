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

@implementation MHCountDown

+(MHCountDown *) countdownForDate:(NSDate*) date
{
   MHCountDown* countDown = [[MHCountDown alloc] init];
   
   NSTimeInterval timeDiff = [date timeIntervalSinceNow];
   
   if (timeDiff > 0.0)
   {
      countDown.futureTime = YES;
   }
   else
   {
      timeDiff *= -1;
   }
   
   countDown.days    = timeDiff / CD_DAY;
   timeDiff -= (countDown.days * CD_DAY);
   
   countDown.hours   = timeDiff / CD_HOUR;
   timeDiff -= (countDown.hours * CD_HOUR);
   
   countDown.minutes = timeDiff / CD_MINUTE;
   timeDiff -= (countDown.minutes * CD_MINUTE);
   
   countDown.seconds = timeDiff;
   
   return countDown;
}

-(NSString*) description
{
   NSString* isFuture = self.futureTime ? @"YES" : @"NO";
   return [NSString stringWithFormat:@"Future = %@, %u:%02u:%02u.%02u", isFuture, self.days, self.hours, self.minutes, self.seconds];
}

@end
