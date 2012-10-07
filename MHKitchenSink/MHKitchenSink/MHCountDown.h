//
//  MHCountDown.h
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHCountDown : NSObject

@property (assign, nonatomic) BOOL       futureTime;
@property (assign, nonatomic) NSUInteger days;
@property (assign, nonatomic) NSUInteger hours;
@property (assign, nonatomic) NSUInteger minutes;
@property (assign, nonatomic) NSUInteger seconds;

+(MHCountDown *) countdownForDate:(NSDate*) date;

@end
