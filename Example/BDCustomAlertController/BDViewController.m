//
//  BDViewController.m
//  BDCustomAlertController
//
//  Created by benny.davidovitz@gmail.com on 08/12/2018.
//  Copyright (c) 2018 benny.davidovitz@gmail.com. All rights reserved.
//

#import "BDViewController.h"
@import BDCustomAlertController;

@interface BDViewController ()

@end

@implementation BDViewController

#pragma mark - UIAlertAction



- (IBAction)alertWithCustomContentAction:(UIButton *)sender {
    
    UIAlertControllerStyle style = [[sender currentTitle] containsString:@"Alert"] ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Test Alert" message:@"message goes here" preferredStyle:style];
    
    UIColor *color = [UIColor colorWithRed:0 green:122.0/255.0 blue:1 alpha:1];
    
    UIAlertActionCustomContent *cameraCustomContent = [[UIAlertActionCustomContent alloc] initWithText:@"Trailing" textColor:color image:[UIImage imageNamed:@"icons8-camera"] layout:UIAlertActionCustomContentLayoutTrailing];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithCustomContent:cameraCustomContent handler:^(UIAlertAction *action) {
        
        NSLog(@"%@",[[action content] text]);
        
    }];
    
    [alert addAction:cameraAction];
    
    UIAlertActionCustomContent *galleryContent = [[UIAlertActionCustomContent alloc] initWithText:@"Leading" textColor:color image:[UIImage imageNamed:@"icons8-stack_of_photos"] layout:UIAlertActionCustomContentLayoutLeading];
    
    [alert addAction:[UIAlertAction actionWithCustomContent:galleryContent handler:^(UIAlertAction *action) {
        NSLog(@"%@",[[action content] text]);
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:NULL]];
    
    [self presentViewController:alert animated:YES completion:NULL];
}

- (IBAction)alertWithImageInItemsAction:(UIButton *)sender {
    
    UIAlertControllerStyle style = [[sender currentTitle] containsString:@"Alert"] ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Test Alert" message:nil preferredStyle:style];
    
    UIAlertAction *facebookAction = [UIAlertAction actionWithTitle:@"Facebook" style:UIAlertActionStyleDefault handler:NULL];
    facebookAction.image = [UIImage imageNamed:@"icons8-facebook"];
    [alert addAction:facebookAction];
    
    alert.tintColor = [UIColor orangeColor];
    
    [self presentViewController:alert animated:YES completion:NULL];
}

#pragma mark - UIAlertContorller

- (IBAction)alertControllerWithDatePickerAction:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Date Picker" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDestructive handler:NULL]];
    
    [alert insertDatePickerWithConfigHandler:^(UIDatePicker *datePicker) {
        [datePicker setDatePickerMode:UIDatePickerModeDate];
        [datePicker setMaximumDate:[NSDate new]];
        
        [datePicker addTarget:self action:@selector(datePickerAction:) forControlEvents:UIControlEventValueChanged];
    }];
    
    [self presentViewController:alert animated:YES completion:NULL];
    
}

- (void) datePickerAction:(UIDatePicker *)datePickerAction{
    NSLog(@"%@",datePickerAction.date);
}

- (IBAction)alertWithTintAction:(id)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert with tint" message:@"A Message" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:NULL]];
    
    [alert setTintColor:[UIColor blueColor]];
    
    [self presentViewController:alert animated:YES completion:NULL];
}

@end
