//
//  StaticCellViewController.m
//  MHelloStaticCell
//
//  Created by thatsoul on 15/9/9.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "StaticCellMasterViewController.h"

@interface StaticCellMasterViewController ()

@end

@implementation StaticCellMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - user event
- (IBAction)onTapBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
