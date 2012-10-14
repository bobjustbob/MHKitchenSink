//
//  MHMainViewController.m
//  MHKitchenSinkExampleApplication
//
//  Created by Bobby Williams on 10/6/12.
//  Copyright (c) 2012 Bobby Williams. All rights reserved.
//

#import "MHMainViewController.h"
#import "MHBaseCell.h"

@interface MHMainViewController ()

@property (strong, nonatomic) NSArray* cells;


@end

@implementation MHMainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
   [super viewDidLoad];
   
   MHBaseCell* countDownCell   = [[MHBaseCell alloc] initWithTitle:@"MHCountDown" description:@"Countdown clock" seque:@"segueToCountDown"];
   MHBaseCell* phoneNumberCell = [[MHBaseCell alloc] initWithTitle:@"Phone Number/ZIPCODE" description:@"US Phone and ZIPCODE delegates" seque:@"segueToSimpleUSPhoneEditor"];
   MHBaseCell* currencyCell    = [[MHBaseCell alloc] initWithTitle:@"Currency" description:@"Currency text delegate example" seque:@"segueToCurrency"];

   self.cells = @[countDownCell, phoneNumberCell, currencyCell];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return self.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return self.cells[indexPath.row];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   MHBaseCell* cell = (MHBaseCell*) [tableView cellForRowAtIndexPath:indexPath];
   
   [self performSegueWithIdentifier:cell.segueName sender:self];
}

@end
