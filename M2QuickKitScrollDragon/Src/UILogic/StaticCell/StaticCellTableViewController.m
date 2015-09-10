//
//  StaticCellTableViewController.m
//  MHelloStaticCell
//
//  Created by thatsoul on 15/9/9.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "StaticCellTableViewController.h"
#import "SubViewController.h"

@interface StaticCellTableViewController ()
@end

@implementation StaticCellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 1) {
        return YES;
    }

    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 1) {
        DDLogDebug(@"indexPath(%@)", indexPath);
        SubViewController *controller = [SubViewController new];
        [self.navigationController pushViewController:controller animated:YES];
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - user event
- (IBAction)onTapCellButton:(id)sender {
    SubViewController *controller = [SubViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)onSlideValueChanged:(UISlider *)slide {
    DDLogDebug(@"slide-value(%@)", @(slide.value));
}

@end
