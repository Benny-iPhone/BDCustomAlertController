//
//  UIAlertController+DatePicker.h
//  CusomizableAlertController
//
//  Created by Benny Davidovitz on 12/08/2018.
//  Copyright © 2018 benny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertControllerDatePickerConfigHandler)(UIDatePicker *datePicker);

@interface UIAlertController (BDDatePicker)

- (nullable UIDatePicker *)datePicker;
- (void) insertDatePickerWithConfigHandler:(nullable UIAlertControllerDatePickerConfigHandler)configHandler;

@end
