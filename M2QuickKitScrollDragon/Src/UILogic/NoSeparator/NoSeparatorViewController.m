//
//  NoSeparatorViewController.m
//  M2QuickKitScrollDragon
//
//  Created by thatsoul on 15/9/6.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "NoSeparatorViewController.h"

static NSString * const kCellIdentifier = @"kCellIdentifier";

@interface NoSeparatorViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *hasDataButton;
@property (weak, nonatomic) IBOutlet UIButton *noDataButton;
@property (nonatomic) NSArray *datas;
@end

@implementation NoSeparatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // !!就是这句黑科技
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - user event
- (IBAction)onTapHasData:(id)sender {
    self.datas = @[@"0", @"1", @"2", @"3"];
    [self.tableView reloadData];
}

- (IBAction)onTapNoData:(id)sender {
    self.datas = nil;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    NSString *data = [self.datas objectAtIndex:indexPath.row];
    cell.textLabel.text = data;
    
    return cell;
}

@end
