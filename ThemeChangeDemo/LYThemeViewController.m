//
//  LYThmemViewController.m
//  ThemeChangeDemo
//
//  Created by Liu Y on 16/4/5.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYThemeViewController.h"
#import "LYThemeManager.h"
#import "LYThemeLabel.h"
#import "LYThemeButton.h"
#import "LYThemeImageView.h"
#import "LYThemeUtil.h"
#import "LYThemeConst.h"

@interface LYThemeViewController ()

@property (nonatomic, strong) NSArray *themeArr;

@end

@implementation LYThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationItems];
}

- (instancetype)init {
    if ([super init]) {
        self.themeArr = [[LYThemeManager shareInstance].themesPlist allKeys];
    }
    return self;
}

#pragma mark - Create UI
- (void)initNavigationItems {
    LYThemeLabel *titleLabel = [LYThemeUtil createLabel:kNavigationBarTitleLabel];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    titleLabel.text = @"主题列表";
    titleLabel.frame = CGRectMake(0, 0, 200, 44);
    self.navigationItem.titleView = titleLabel;
    
    LYThemeButton *backBtn = [LYThemeUtil createButton:@"navigationbar_back.png"
                                       highlighted:@"navigationbar_back_highlighted.png"];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

#pragma mark - Button Actions
- (void)backBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.themeArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"themeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        UILabel *textLabel = [LYThemeUtil createLabel:kThemeListLabel];
        textLabel.frame = CGRectMake(10, 10, self.view.frame.size.width - 120,30);
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        textLabel.tag = 101;
        [cell.contentView addSubview:textLabel];
    }
    UILabel *textLabel = (UILabel *)[cell.contentView viewWithTag:101];
    NSString *theme = self.themeArr[indexPath.row];
    textLabel.text = theme;
    
    NSString *themeName = [LYThemeManager shareInstance].themeName;
    if (themeName == nil) {
        themeName = @"默认";
    }
    if ([themeName isEqualToString:theme]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - UITableView Delegata
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *themeName = [self.themeArr objectAtIndex:indexPath.row];
    if ([themeName isEqualToString:@"默认"]) {
        themeName = nil;
    }
    
    // 保存当前选择的主题到本地
    [[NSUserDefaults standardUserDefaults] setObject:themeName forKey:kThemeName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [LYThemeManager shareInstance].themeName = themeName;
    
    // 发送一个kThemeDidChangeNotification的通知，切换主题
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNotification object:themeName];
    [tableView reloadData];
}


@end
