//
//  LYThemeUtil.h
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYThemeLabel.h"
#import "LYThemeButton.h"
#import "LYThemeImageView.h"

@interface LYThemeUtil : NSObject

+ (LYThemeButton *)createButton:(NSString *)imageName highlighted:(NSString *)highlightImageName;

+ (LYThemeButton *)createButtonWithBackground:(NSString *)backgroundImageName backgroundHighlighted:(NSString *)backgroundHighlightImageName;

+ (LYThemeImageView *)createImageView:(NSString *)imageName;

+ (LYThemeLabel *)createLabel:(NSString *)colorName;

@end
