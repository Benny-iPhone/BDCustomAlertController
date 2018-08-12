//
//  UIAlertAction+undocumentedImage.m
//  CusomizableAlertController
//
//  Created by Benny Davidovitz on 08/08/2018.
//  Copyright © 2018 benny. All rights reserved.
//

#import "UIAlertAction+undocumentedImage.h"

@implementation UIAlertAction (BDUndocumentedImage)
@dynamic image;

+ (instancetype)actionWithTitle:(nullable NSString *)title image:(nullable UIImage *)image style:(UIAlertActionStyle)style handler:(void (^ __nullable)(UIAlertAction *action))handler{
    UIAlertAction *action = [self actionWithTitle:title style:style handler:handler];
    action.image = image;
    
    return action;
}


@end
