//
//  LYThemeManager.h
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kThemeName @"kThemeName"
#define kThemeDidChangeNotification @"kThemeDidChangeNotification"

@interface LYThemeManager : NSObject <NSCopying, NSMutableCopying>

/**
 *  主题名称
 */
@property (nonatomic, copy) NSString *themeName;

/**
 *  主题配置 theme.plist 文件
 */
@property (nonatomic, strong) NSDictionary *themesPlist;

/**
 *  Label 字体颜色配置 fontColor.plist 文件
 */
@property (nonatomic, strong) NSDictionary *fontColorPlist;

+ (instancetype)shareInstance;

- (UIImage *)getThemeImage:(NSString *)imageName;

- (UIColor *)getColorWithName:(NSString *)name;

@end
