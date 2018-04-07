//
//  RatingControl.m
//  FoodTracker
//
//  Created by Clifford Lee on 4/7/18.
//  Copyright © 2018 Clifford Lee. All rights reserved.
//

#import "RatingControl.h"

@implementation RatingControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _ratingButtons = [[NSMutableArray alloc] init];
    _rating = 0;
    
    [self setupButtons];
    
    [_ratingButtons enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
        btn.selected = idx < _rating;
    }];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    _ratingButtons = [NSMutableArray array];
    _rating = 0;
    
    [self setupButtons];
    
    return self;
}

- (void)setupButtons {
    
    UIImage *emptyStar = [UIImage imageNamed:@"emptyStar"];
    UIImage *filledStar = [UIImage imageNamed:@"filledStar"];
    UIImage *highlightedStar = [UIImage imageNamed:@"highlightedStar"];
    
    for (int i = 0; i < 5; i++) {
        UIButton *button = [[UIButton alloc] init];
        
        [button setImage:emptyStar forState:UIControlStateNormal];
        [button setImage:filledStar forState:UIControlStateSelected];
        [button setImage:highlightedStar forState:UIControlStateHighlighted];
        [button setImage:highlightedStar forState:UIControlStateSelected | UIControlStateHighlighted];
        
        // Define a fixed size 44x44 button
        button.translatesAutoresizingMaskIntoConstraints = false;
        [button.heightAnchor constraintEqualToConstant:44.0].active = TRUE;
        [button.widthAnchor constraintEqualToConstant:44.0].active = TRUE;
        
        [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addArrangedSubview:button];
        [_ratingButtons addObject:button];
    }
}

/* Actions */
- (void)ratingButtonTapped:(UIButton*)button {
    unsigned int index = (unsigned int)[_ratingButtons indexOfObject:button];

    if (index + 1 == _rating) {
        _rating = 0;
    } else {
        _rating = index + 1;
    }
    
    [_ratingButtons enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
        btn.selected = idx < _rating;
    }];
}

@end
