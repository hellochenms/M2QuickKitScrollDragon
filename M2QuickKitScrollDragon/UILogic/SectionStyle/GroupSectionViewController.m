//
//  GroupSectionViewController.m
//  M2QuickKitScrollDragon
//
//  Created by thatsoul on 15/8/20.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "GroupSectionViewController.h"
#import <Masonry/Masonry.h>

static NSString * const kCellIdentifier = @"kCellIdentifier";

@interface GroupSectionViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation GroupSectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor cyanColor];
    self.tableView.tableFooterView = nil;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor orangeColor];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *superView = [label superview];
        make.edges.equalTo(superView).insets(UIEdgeInsetsMake(0, 60, 0, 60));
    }];
    label.text = [NSString stringWithFormat:@"%ld", section];
    
    return view;
}

@end
