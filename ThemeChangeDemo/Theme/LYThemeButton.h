//
//  LYThemeButton.h
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYThemeButton : UIButton

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *highlightImageName;

@property (nonatomic, copy) NSString *backgroundImageName;
@property (nonatomic, copy) NSString *backgroundHighlightImageName;

- (instancetype)initWithImage:(NSString *)imageName highlighted:(NSString *)highlightImageName;

- (instancetype)initWithBackground:(NSString *)backgroundImageName highlightedBackground:(NSString *)backgroundHighlightImageName;

@end
