//
//  MealTableViewCell.h
//  FoodTracker
//
//  Created by Clifford Lee on 4/7/18.
//  Copyright © 2018 Clifford Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"

@interface MealTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet RatingControl *ratingControl;

@end
