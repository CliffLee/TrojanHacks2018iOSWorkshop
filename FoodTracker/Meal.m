//
//  Meal.m
//  FoodTracker
//
//  Created by Clifford Lee on 4/7/18.
//  Copyright © 2018 Clifford Lee. All rights reserved.
//

#import "Meal.h"

@implementation Meal

- (instancetype)init:(NSString *)name :(UIImage *)photo :(int)rating {
    self = [super init];
    
    if (name == nil || rating < 0 || rating > 5) {
        return nil;
    }
    
    if (self) {
        self.name = name;
        self.photo = photo;
        self.rating = rating;
    }
    
    return self;
}

@end
