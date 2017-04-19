//
//  LYThemeLabel.m
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYThemeLabel.h"
#import "LYThemeManager.h"

@implementation LYThemeLabel

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

- (instancetype)initWithColorName:(NSString *)colorName {
    if (self = [self init]) {
        self.colorName = colorName;
    }
    return self;
}

#pragma mark - setter
- (void)setColorName:(NSString *)colorName {
    if (_colorName != colorName) {
        _colorName = [colorName copy];
    }
    [self setColor];
}

- (void)setColor {
    UIColor *textColor = [[LYThemeManager shareInstance] getColorWithName:_colorName];
    self.textColor = textColor;
}

#pragma mark - NSNotification Actions
- (void)themeNotification:(NSNotification *)notification {
    [self setColor];
}

#pragma mark - Memery Manager
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
