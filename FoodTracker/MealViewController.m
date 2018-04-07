//
//  ViewController.m
//  FoodTracker
//
//  Created by Clifford Lee on 4/6/18.
//  Copyright © 2018 Clifford Lee. All rights reserved.
//

#import "MealViewController.h"
#import "Meal.h"

@interface MealViewController ()

@end

@implementation MealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Meal *m = _meal;
    if (m != nil) {
        self.navigationItem.title = [_meal name];
        self.nameTextField.text = [_meal name];
        self.photoImageView.image = [_meal photo];
        self.ratingControl.rating = [_meal rating];
    }
    
    _nameTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Actions */

/* Delegate Functions */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_nameTextField resignFirstResponder];
    
    return TRUE;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

}

- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender {
    // Hide the keyboard.
    [_nameTextField resignFirstResponder];
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    
    [self presentViewController:imagePickerController animated:TRUE completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    if (selectedImage == nil) {
        return;
    }
    
    _photoImageView.image = selectedImage;
    
    [picker dismissViewControllerAnimated:true completion:nil];
}

/* Navigation */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    UIBarButtonItem *saveBtn = sender;
    
    NSString *name = _nameTextField.text;
    UIImage *photo = _photoImageView.image;
    int rating = _ratingControl.rating;
    
    _meal = [[Meal alloc] init:name :photo :rating];
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
