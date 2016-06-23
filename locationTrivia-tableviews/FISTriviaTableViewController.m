//
//  FISTriviaTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Ryan Cohen on 6/23/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"
#import "FISTrivium.h"

@interface FISTriviaTableViewController ()

@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.accessibilityLabel = @"Trivia Table";
    self.tableView.accessibilityIdentifier = @"Trivia Table";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.trivia.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    FISTrivium *trivia = (FISTrivium *)self.trivia[indexPath.row];
    cell.textLabel.text = trivia.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu likes", trivia.likes];
    
    return cell;
}

@end
