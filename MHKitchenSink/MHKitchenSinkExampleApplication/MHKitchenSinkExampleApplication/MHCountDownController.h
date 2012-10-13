//
//  MHCountDownController.h
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/13/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../MHKitchenSink/MHCountDown.h"

@interface MHCountDownController : UIViewController<MHCountDownDelegate>

@property (weak, nonatomic)  IBOutlet UILabel *countdownFuture;
@property (strong, nonatomic)         MHCountDown* cdFuture;


@end
