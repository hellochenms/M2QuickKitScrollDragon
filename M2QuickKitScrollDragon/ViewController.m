//
//  ViewController.m
//  M2QuickKitScrollGragon
//
//  Created by thatsoul on 15/7/5.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "ViewController.h"
#import "TableSimpleCellViewController.h"
#import "GroupSectionViewController.h"

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
    
    self.datas = @[@[@"TableSimpleCell", [TableSimpleCellViewController class]],
                   @[@"GroupSectionStyle", [GroupSectionViewController class]],
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
    UIViewController *controller = [data[1] new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
