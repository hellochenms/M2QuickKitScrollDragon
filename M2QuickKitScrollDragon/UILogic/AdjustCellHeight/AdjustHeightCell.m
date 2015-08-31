//
//  AdjustCell.m
//  MHelloAdjustCell
//
//  Created by thatsoul on 15/4/9.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "AdjustHeightCell.h"

@interface AdjustHeightCell ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@end

@implementation AdjustHeightCell

- (void)reloadData:(NSArray *)data {
    self.label.text = data[0];
    self.label2.text = data[1];
}

@end
