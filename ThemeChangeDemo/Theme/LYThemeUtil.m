//
//  LYThemeUtil.m
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYThemeUtil.h"

@implementation LYThemeUtil

+ (LYThemeButton *)createButton:(NSString *)imageName highlighted:(NSString *)highlightImageName {
    LYThemeButton *button = [[LYThemeButton alloc] initWithImage:imageName highlighted:highlightImageName];
    return button;
}

+ (LYThemeButton *)createButtonWithBackground:(NSString *)backgroundImageName
                      backgroundHighlighted:(NSString *)backgroundHighlightImageName {
    LYThemeButton *button = [[LYThemeButton alloc] initWithBackground:backgroundImageName highlightedBackground:backgroundHighlightImageName];
    return button;
}

+ (LYThemeImageView *)createImageView:(NSString *)imageName {
    LYThemeImageView *imageView = [[LYThemeImageView alloc] initWithImageName:imageName];
    return imageView;
}

+ (LYThemeLabel *)createLabel:(NSString *)colorName {
    LYThemeLabel *label = [[LYThemeLabel alloc] initWithColorName:colorName];
    return label;
}

@end
