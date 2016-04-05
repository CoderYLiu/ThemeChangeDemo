//
//  LYThemeLabel.h
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYThemeLabel : UILabel

@property (nonatomic, copy) NSString *colorName;

- (instancetype)initWithColorName:(NSString *)colorName;

@end
