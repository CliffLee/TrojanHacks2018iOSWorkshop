//
//  Meal.h
//  FoodTracker
//
//  Created by Clifford Lee on 4/7/18.
//  Copyright © 2018 Clifford Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Meal : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) UIImage* photo;
@property (nonatomic) int rating;

@end
