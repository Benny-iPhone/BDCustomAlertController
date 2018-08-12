//
//  UIAlertController+DatePicker.m
//  CusomizableAlertController
//
//  Created by Benny Davidovitz on 12/08/2018.
//  Copyright © 2018 benny. All rights reserved.
//

#import "UIAlertController+DatePicker.h"

@implementation UIAlertController (BDDatePicker)

- (void) insertDatePickerWithConfigHandler:(nullable UIAlertControllerDatePickerConfigHandler)configHandler
{
    
    UIViewController *viewController = [[UIViewController alloc] init];
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    if (configHandler != NULL){
        configHandler(datePicker);
    }
    
    datePicker.translatesAutoresizingMaskIntoConstraints = NO;
    
    [viewController.view addSubview:datePicker];
    [viewController.view addConstraints:@[
                                          [NSLayoutConstraint constraintWithItem:datePicker attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:viewController.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0],
                                          [NSLayoutConstraint constraintWithItem:datePicker attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:viewController.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                          [NSLayoutConstraint constraintWithItem:datePicker attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:viewController.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0],
                                          [NSLayoutConstraint constraintWithItem:datePicker attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:viewController.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0],
                                          ]];
    
    [self setValue:viewController forKey:@"contentViewController"];
    
    
}


@end
