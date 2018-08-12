//
//  UIAlertAction+customContent.h
//  CusomizableAlertController
//
//  Created by Benny Davidovitz on 10/08/2018.
//  Copyright © 2018 benny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIAlertActionCustomContentLayout) {
    UIAlertActionCustomContentLayoutLeading = 0,
    UIAlertActionCustomContentLayoutTrailing,
};

@interface UIAlertActionCustomContent : NSObject

@property (nonatomic, strong, readonly, nonnull) NSString *text;
@property (nonatomic, strong, readonly, nonnull) UIImage *image;
@property (nonatomic, assign) UIAlertActionCustomContentLayout customContentLayout;


@property (nonatomic, strong, readonly ,nullable) UIColor *labelTextColor;
@property (nonatomic, strong, nullable) UIFont *labelFont;
@property (nonatomic, assign) CGFloat margin; //default is 8

- (instancetype) initWithText:(nonnull NSString *)text textColor:(nullable UIColor *)textColor image:(nonnull UIImage *)image layout:(UIAlertActionCustomContentLayout)layout;

@end

@interface UIAlertAction (BDCustomContent)

- (nullable UIAlertActionCustomContent *) content;

+ (instancetype)actionWithCustomContent:(UIAlertActionCustomContent *)customContent handler:(void (^ __nullable)(UIAlertAction *action))handler;


@end
