//
//  LYThemeButton.m
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYThemeButton.h"
#import "LYThemeManager.h"

@implementation LYThemeButton

- (id)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithImage:(NSString *)imageName highlighted:(NSString *)highlightImageName {
    if ([self init]) {
        self.imageName = imageName;
        self.highlightImageName = highlightImageName;
    }
    return self;
}

- (instancetype)initWithBackground:(NSString *)backgroundImageName highlightedBackground:(NSString *)backgroundHighlightImageName {
    if ([self init]) {
        self.backgroundImageName = backgroundImageName;
        self.backgroundHighlightImageName = backgroundHighlightImageName;
    }
    return self;
}

- (instancetype)init {
    if ([super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

#pragma mark - NSNotification Actions
- (void)themeNotification:(NSNotification *)notification {
    [self loadThemeImage];
}

- (void)loadThemeImage {
    if (self.imageName == nil
        && self.highlightImageName == nil
        && self.backgroundImageName == nil
        && self.backgroundHighlightImageName == nil) {
        return;
    }
    
    LYThemeManager *themeManager = [LYThemeManager shareInstance];
    
    UIImage *image = [themeManager getThemeImage:_imageName];
    UIImage *highlightImage = [themeManager getThemeImage:_highlightImageName];
    
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:highlightImage forState:UIControlStateHighlighted];
    
    UIImage *backImage = [themeManager getThemeImage:_backgroundImageName];
    backImage = [backImage stretchableImageWithLeftCapWidth:3 topCapHeight:3];
    UIImage *backHighlightImage = [themeManager getThemeImage:_backgroundHighlightImageName];
    backHighlightImage = [backHighlightImage stretchableImageWithLeftCapWidth:3 topCapHeight:3];
    
    [self setBackgroundImage:backImage forState:UIControlStateNormal];
    [self setBackgroundImage:backHighlightImage forState:UIControlStateHighlighted];
}

#pragma mark - setter
- (void)setImageName:(NSString *)imageName {
    if (_imageName != imageName) {
        _imageName = [imageName copy];
    }
    [self loadThemeImage];
}

- (void)setHighlightImageName:(NSString *)highlightImageName {
    if (_highlightImageName != highlightImageName) {
        _highlightImageName = [highlightImageName copy];
    }
    [self loadThemeImage];
}

- (void)setBackgroundImageName:(NSString *)backgroundImageName {
    if (_backgroundImageName != backgroundImageName) {
        _backgroundImageName = [backgroundImageName copy];
    }
    [self loadThemeImage];
}

- (void)setBackgroundHighlightImageName:(NSString *)backgroundHighlightImageName {
    if (_backgroundHighlightImageName != backgroundHighlightImageName) {
        _backgroundHighlightImageName = [backgroundHighlightImageName copy];
    }
    [self loadThemeImage];
}

#pragma mark - Memery Manager
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
}

@end
