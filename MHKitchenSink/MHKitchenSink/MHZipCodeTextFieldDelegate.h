//
//  MHZipCodeTextFieldDelegate.h
//  MHKitchenSink
//
//  Created by Bobby Williams on 10/12/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum
{
   mhZipCodeNoPlus4,
   mnZipCodePlus4Optional,
   mhZipCodePlus4Required
} MHZipCodeOptions;

@class MHZipCodeTextFieldDelegate;

@protocol MHZipCodeEditorDelegate

-(void) zipcodeFieldHasChanged:(MHZipCodeTextFieldDelegate*) zipcodeDelegate;

@end


@interface MHZipCodeTextFieldDelegate : NSObject <UITextFieldDelegate>

@property (weak, nonatomic)             UITextField*                textField;
@property (assign, readonly, nonatomic) BOOL                        isValid;
@property (weak, nonatomic)             id<MHZipCodeEditorDelegate> delegate;
@property (assign, nonatomic)           MHZipCodeOptions            zipCodeOptions;
@property (weak, nonatomic)             NSString*                   zipCode;
@property (readonly, nonatomic)         NSString*                   formattedZipCode;

-(id)        initAndAttach:(UITextField*) textField withOption:(MHZipCodeOptions) option;
-(void)      attach:(UITextField*) textField;

-(NSString*) formattedZipCode;

@end
