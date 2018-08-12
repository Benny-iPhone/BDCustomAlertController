//
//  UIAlertController+tintColor.m
//  CusomizableAlertController
//
//  Created by Benny Davidovitz on 10/08/2018.
//  Copyright © 2018 benny. All rights reserved.
//

#import "UIAlertController+tintColor.h"

@implementation UIAlertController (BDTintColor)

- (void) setTintColor:(UIColor *)tintColor{
    self.view.tintColor = tintColor;
}

- (UIColor *) tintColor{
    return self.view.tintColor;
}

@end
