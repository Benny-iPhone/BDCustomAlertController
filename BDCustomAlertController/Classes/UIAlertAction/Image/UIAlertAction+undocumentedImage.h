//
//  UIAlertAction+undocumentedImage.h
//  CusomizableAlertController
//
//  Created by Benny Davidovitz on 08/08/2018.
//  Copyright © 2018 benny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertAction (BDUndocumentedImage)

+ (instancetype)actionWithTitle:(nullable NSString *)title image:(nullable UIImage *)image style:(UIAlertActionStyle)style handler:(void (^ __nullable)(UIAlertAction *action))handler;

@property (nonatomic, strong, nullable) UIImage *image;

@end
