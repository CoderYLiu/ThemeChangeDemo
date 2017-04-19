//
//  LYThemeImageView.h
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYThemeImageView : UIImageView

@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, assign) CGFloat leftCapWidth;
@property (nonatomic, assign) CGFloat topCapHeight;

- (instancetype)initWithImageName:(NSString *)imageName;

@end
