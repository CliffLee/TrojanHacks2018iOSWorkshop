//
//  ViewController.m
//  FoodTracker
//
//  Created by Clifford Lee on 4/6/18.
//  Copyright © 2018 Clifford Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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
    _mealNameLabel.text = textField.text;
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

@end
