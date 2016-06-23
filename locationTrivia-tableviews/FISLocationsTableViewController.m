//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Ryan Cohen on 6/23/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Location Trivia";
    
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    
    FISLocation *location1 = [[FISLocation alloc] initWithName:@"The Empire State Building"
                                                      latitude:40.7484
                                                     longitude:-73.9857];
    
    FISTrivium *trivia1A = [[FISTrivium alloc] initWithContent:@"1,454 Feet Tall" likes:4];
    FISTrivium *trivia1B = [[FISTrivium alloc] initWithContent:@"Cost $24,718,000 to build" likes:2];
    
    [location1.trivia addObjectsFromArray:@[trivia1A, trivia1B]];
    
    FISLocation *location2 = [[FISLocation alloc] initWithName:@"Bowling Green"
                                                      latitude:41.3739
                                                     longitude:-83.6508];
    
    FISTrivium *trivia2A = [[FISTrivium alloc] initWithContent:@"NYC's oldest park" likes:8];
    FISTrivium *trivia2B = [[FISTrivium alloc] initWithContent:@"Made a park in 1733" likes:2];
    FISTrivium *trivia2C = [[FISTrivium alloc] initWithContent:@"Charging Bull was created in 1989" likes:0];
    
    [location2.trivia addObjectsFromArray:@[trivia2A, trivia2B, trivia2C]];
    
    FISLocation *location3 = [[FISLocation alloc] initWithName:@"Statue Of Liberty"
                                                      latitude:40.6892
                                                     longitude:74.0444];
    FISTrivium *trivia3A = [[FISTrivium alloc] initWithContent:@"Gift from the french" likes:6];
    
    [location3.trivia addObjectsFromArray:@[trivia3A]];
    
    self.locations = @[location1, location2, location3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.locations.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.locations[section] trivia].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.locations[section] name];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    FISLocation *location = (FISLocation *)self.locations[indexPath.section];
    FISTrivium *trivium = location.trivia[indexPath.row];
    
    cell.textLabel.text = trivium.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu likes", trivium.likes];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return NO;
}

@end
