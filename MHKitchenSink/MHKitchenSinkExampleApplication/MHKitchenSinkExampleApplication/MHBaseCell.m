//
//  MHBaseCell.m
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHBaseCell.h"

@implementation MHBaseCell


-(id) initWithTitle:(NSString*) title description:(NSString*) description seque:(NSString*) segue
{
   self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:segue];
   
   if (self)
   {
      self.segueName            = segue;
      self.textLabel.text       = title;
      self.detailTextLabel.text = description;
      self.accessoryType        = UITableViewCellAccessoryDisclosureIndicator;
//      self.selectionStyle       = UITableViewCellSelectionStyleNone;
   }
   return self;
}

@end
