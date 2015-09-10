//
//  AdjustCellHeightViewController.m
//  M2QuickKitScrollDragon
//
//  Created by thatsoul on 15/8/31.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "AdjustCellHeightViewController.h"
#import "AdjustHeightCell.h"
#import <UITableView+FDTemplateLayoutCell.h>

static NSString * const kCellIdentifier = @"kCellIdentifier";

@interface AdjustCellHeightViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *datas;
@end

@implementation AdjustCellHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.datas = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        NSMutableArray *data = [NSMutableArray array];
        
        NSMutableString *firstString = [NSMutableString string];
        [firstString appendString:@"^----"];
        NSInteger firstCount = arc4random() % 50 + 5;
        for (NSInteger j = 0; j < firstCount; j++) {
            [firstString appendString:@"123"];
        }
        [firstString appendString:@"----$"];
        [data addObject:[firstString copy]];
        
        NSMutableString *secondString = [NSMutableString string];
        [secondString appendString:@"^----"];
        NSInteger secondCount = arc4random() % 50 + 5;
        for (NSInteger j = 0; j < secondCount; j++) {
            [secondString appendString:@"456"];
        }
        [secondString appendString:@"----$"];
        [data addObject:[secondString copy]];
        
        [self.datas addObject:data];
    }
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AdjustHeightCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCellIdentifier];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AdjustHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    NSArray *data = [self.datas objectAtIndex:indexPath.row];
    [cell reloadData:data];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight = [tableView fd_heightForCellWithIdentifier:kCellIdentifier cacheByIndexPath:indexPath configuration:^(id cell) {
        NSArray *data = [self.datas objectAtIndex:indexPath.row];
        [cell reloadData:data];
    }];
    
    return cellHeight;
}

@end
