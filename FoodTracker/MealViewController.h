//
//  ViewController.h
//  FoodTracker
//
//  Created by Clifford Lee on 4/6/18.
//  Copyright © 2018 Clifford Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"
#import "Meal.h"

@interface MealViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

/* IBOutlets */
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (weak, nonatomic) IBOutlet RatingControl *ratingControl;

@property (strong, nonatomic) Meal *meal;

/* Actions */
- (IBAction)cancel:(UIBarButtonItem *)sender;


@end

