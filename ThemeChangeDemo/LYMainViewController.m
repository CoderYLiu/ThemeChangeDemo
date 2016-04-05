//
//  LYMainViewController.m
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYMainViewController.h"
#import "LYThemeConst.h"
#import "LYThemeUtil.h"
#import "LYThemeLabel.h"
#import "LYThemeButton.h"
#import "LYThemeImageView.h"
#import "LYThemeViewController.h"

@interface LYMainViewController ()

@end

@implementation LYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavigationItems];
    [self initSubViews];
}

#pragma mark - Create UI
- (void)initNavigationItems {
    LYThemeImageView *titleView = [LYThemeUtil createImageView:@"title_logo.png"];
    titleView.frame = CGRectMake(0, 0, 70, 44);
    titleView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = titleView;
}

- (void)initSubViews {
    LYThemeLabel *textLabel = [LYThemeUtil createLabel:kThemeListLabel];
    textLabel.frame = CGRectMake(ScreenWidth/2-120, 100, 240, 30);
    textLabel.font = [UIFont systemFontOfSize:14.0f];
    textLabel.text = @"这是一个切换主题的Demo";
    [self.view addSubview:textLabel];
    
    LYThemeImageView *iconView = [LYThemeUtil createImageView:@"background.png"];
    iconView.frame = CGRectMake(ScreenWidth/2-85/2, 170, 85, 85);
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:iconView];
    
    LYThemeButton *enterBtn = [LYThemeUtil createButtonWithBackground:@"button_background.png" backgroundHighlighted:@"button_delete_background.png"];
    enterBtn.frame = CGRectMake(ScreenWidth/2-30, 300, 60, 30);
    enterBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    enterBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [enterBtn setTitle:@"切换主题" forState:UIControlStateNormal];
    [enterBtn addTarget:self action:@selector(changeTheme:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:enterBtn];;
}

- (void)changeTheme:(id)sender {
    LYThemeViewController *themeViewController = [[LYThemeViewController alloc]init];
    [self.navigationController pushViewController:themeViewController animated:YES];
}


@end
