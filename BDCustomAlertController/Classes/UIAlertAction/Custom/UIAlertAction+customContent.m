//
//  UIAlertAction+customContent.m
//  CusomizableAlertController
//
//  Created by Benny Davidovitz on 10/08/2018.
//  Copyright © 2018 benny. All rights reserved.
//

#import "UIAlertAction+customContent.h"


@interface UIAlertActionCustomContentViewController : UIViewController

@property (nonatomic, strong) UIAlertActionCustomContent *content;

@end

@implementation UIAlertActionCustomContentViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = self.content.text;
    if (self.content.labelFont) {
        label.font = self.content.labelFont;
    }
    
    if (self.content.labelTextColor) {
        label.textColor = self.content.labelTextColor;
    }
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.content.image];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:imageView];
    
    NSArray <NSLayoutConstraint *>*constraints = @[];
    
    switch (self.content.customContentLayout) {
        case UIAlertActionCustomContentLayoutLeading:
            constraints = @[
                           [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeTrailing multiplier:1 constant:self.content.margin],
                           [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                           [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:label attribute:NSLayoutAttributeTrailing multiplier:1 constant:self.content.margin],
                           [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]
                           ];
            break;
        
        case UIAlertActionCustomContentLayoutTrailing:
            constraints = @[
                           [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:self.content.margin],
                           [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                           [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeTrailing multiplier:1 constant:self.content.margin],
                           [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]
                           ];
            break;
            
        default:
            break;
    }
    
    [self.view addConstraints:constraints];
    
}

@end

@interface UIAlertActionCustomContent()

@property (nonatomic, strong) UIViewController *viewController;

@end

@implementation UIAlertActionCustomContent

- (instancetype) initWithText:(nonnull NSString *)text textColor:(nullable UIColor *)textColor image:(nonnull UIImage *)image layout:(UIAlertActionCustomContentLayout)layout{
    if (self = [self init]) {
        _text = text;
        _image = image;
        _customContentLayout = layout;
        _labelTextColor = textColor;
        UIAlertActionCustomContentViewController *viewController = [[UIAlertActionCustomContentViewController alloc] init];
        viewController.content = self;
        self.viewController = viewController;
        self.margin = 8;
    }
    return self;
}

@end

@implementation UIAlertAction (BDCustomContent)

- (nullable UIAlertActionCustomContent *) content{
    id contentVC = [self valueForKey:@"contentViewController"];
    if ([contentVC isKindOfClass:[UIAlertActionCustomContentViewController class]] == NO) {
        return nil;
    }
    
    UIAlertActionCustomContentViewController *customContentVC = (UIAlertActionCustomContentViewController *)contentVC;
    return customContentVC.content;
}


+ (instancetype)actionWithCustomContent:(UIAlertActionCustomContent *)customContent handler:(void (^ __nullable)(UIAlertAction *action))handler{
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:handler];
    [action setValue:[customContent viewController] forKey:@"contentViewController"];
    
    return action;
}


@end


























