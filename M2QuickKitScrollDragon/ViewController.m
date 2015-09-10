//
//  ViewController.m
//  M2QuickKitScrollGragon
//
//  Created by thatsoul on 15/7/5.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "ViewController.h"
#import "AdjustCellHeightViewController.h"
#import "GroupSectionViewController.h"
#import "NoSeparatorViewController.h"
#import "StaticCellMasterViewController.h"

static NSString * const kCellIdentifier = @"kCellIdentifier";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *datas;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.datas = @[
                   @[@"AdjustCellHeight", [AdjustCellHeightViewController class]],
                   @[@"StaticCell", @"StaticCellMaster", [StaticCellMasterViewController class]],
                   @[@"GroupSectionStyle", [GroupSectionViewController class]],
                   @[@"NoSeparator", [NoSeparatorViewController class]],
                   ];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    NSArray *data = self.datas[indexPath.row];
    cell.textLabel.text = data[0];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *data = self.datas[indexPath.row];
    if ([data count] == 2) {
        UIViewController *controller = [data[1] new];
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:data[1] bundle:[NSBundle mainBundle]];
        UIViewController *controller = [storyboard instantiateInitialViewController];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
