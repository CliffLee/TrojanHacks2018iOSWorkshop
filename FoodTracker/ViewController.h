//
//  ViewController.h
//  FoodTracker
//
//  Created by Clifford Lee on 4/6/18.
//  Copyright © 2018 Clifford Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

/* IBOutlets */
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *mealNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (weak, nonatomic) IBOutlet RatingControl *ratingControl;
/* Actions */
- (IBAction)setDefaultLabelText:(id)sender;

@end

