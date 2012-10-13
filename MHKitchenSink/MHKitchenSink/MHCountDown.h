//
//  MHCountDown.h
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MHCountDown;

@protocol MHCountDownDelegate <NSObject>

-(BOOL) updatedCountDown:(MHCountDown*) countdown;

@end

@interface MHCountDown : NSObject

@property (assign, readonly) BOOL       futureTime;
@property (assign, readonly) NSUInteger days;
@property (assign, readonly) NSUInteger hours;
@property (assign, readonly) NSUInteger minutes;
@property (assign, readonly) NSUInteger seconds;

+(MHCountDown *) countdownForDate:(NSDate*) date delegate:(id<MHCountDownDelegate>) delegate;

@end
