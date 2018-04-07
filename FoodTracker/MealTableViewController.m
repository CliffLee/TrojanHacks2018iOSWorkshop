//
//  MealTableViewController.m
//  FoodTracker
//
//  Created by Clifford Lee on 4/7/18.
//  Copyright © 2018 Clifford Lee. All rights reserved.
//

#import "MealTableViewController.h"
#import "MealTableViewCell.h"
#import "Meal.h"

@interface MealTableViewController ()

@end

@implementation MealTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _meals = [[NSMutableArray alloc] init];
    [self loadSampleMeals];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [_meals count];
}

- (void)loadSampleMeals {
    UIImage *photo1 = [UIImage imageNamed:@"dogfood"];
    UIImage *photo2 = [UIImage imageNamed:@"californiaburger"];
    UIImage *photo3 = [UIImage imageNamed:@"teriyakiwings"];
    
    Meal *meal1 = [[Meal alloc] init:@"Dog Food" :photo1 :1];
    Meal *meal2 = [[Meal alloc] init:@"California Burger" :photo2 :4];
    Meal *meal3 = [[Meal alloc] init:@"Teriyaki Wings" :photo3 :3];
    
    [_meals addObject:meal1];
    [_meals addObject:meal2];
    [_meals addObject:meal3];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MealTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MealTableViewCell" forIndexPath:indexPath];
    
    Meal *m = [_meals objectAtIndex:indexPath.row];
    cell.nameLabel.text = m.name;
    cell.photoImageView.image = m.photo;
    cell.ratingControl.rating = m.rating;
    
    [cell.ratingControl.ratingButtons enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
        btn.selected = idx < cell.ratingControl.rating;
    }];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
