//
//  LYThemeManager.m
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYThemeManager.h"

static LYThemeManager *_instance = nil; // 不能让外部访问,同时放在静态块中

@implementation LYThemeManager

#pragma mark - 单例
+ (instancetype)shareInstance {
    if (!_instance) {
        _instance = [[self alloc] init];
    }
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:zone] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        NSString *themePath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
        self.themesPlist = [NSDictionary dictionaryWithContentsOfFile:themePath];
        self.themeName = nil;
    }
    return self;
}

- (void)setThemeName:(NSString *)themeName {
    if (_themeName != themeName) {
        _themeName = [themeName copy];
    }
    
    NSString *themeDir = [self getThemePath];
    NSString *fontColorPath = [themeDir stringByAppendingPathComponent:@"fontColor.plist"];
    self.fontColorPlist = [NSDictionary dictionaryWithContentsOfFile:fontColorPath];
}

- (NSString *)getThemePath {
    if (!self.themeName) {
        NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
        return resourcePath;
    }
    
    // eg:Skins/blue
    NSString *themePath = [self.themesPlist objectForKey:_themeName];
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    return [resourcePath stringByAppendingPathComponent:themePath];
}

- (UIImage *)getThemeImage:(NSString *)imageName {
    if (imageName.length == 0) {
        return nil;
    }
    NSString *themePath = [self getThemePath];
    NSString *imagePath = [themePath stringByAppendingPathComponent:imageName];
    return [UIImage imageWithContentsOfFile:imagePath];
}

- (UIColor *)getColorWithName:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    NSString *rgb = [_fontColorPlist objectForKey:name];
    NSArray *rgbs = [rgb componentsSeparatedByString:@","];
    if (rgbs.count == 3) {
        CGFloat r = [rgbs[0] floatValue];
        CGFloat g = [rgbs[1] floatValue];
        CGFloat b = [rgbs[2] floatValue];
        return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
    }
    return nil;
}

@end
