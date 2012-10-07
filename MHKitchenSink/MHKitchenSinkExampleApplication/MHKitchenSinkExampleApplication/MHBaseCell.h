//
//  MHBaseCell.h
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHBaseCell : UITableViewCell

@property (strong, nonatomic) NSString* segueName;

-(id) initWithTitle:(NSString*) title description:(NSString*) description seque:(NSString*) segue;

@end
