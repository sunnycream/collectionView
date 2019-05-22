//
//  MyCell.m
//  collection
//
//  Created by admin on 2018/6/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];

        CGFloat width = (kScreenWidth - 20 * 5) / 4;

        self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width / 3)];
        self.myView.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.myView];

        self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, width / 1.5, width, width / 3)];
        self.myLabel.backgroundColor = [UIColor yellowColor];
        self.myLabel.textAlignment = NSTextAlignmentCenter;
        self.myLabel.text = @"100";
        [self.contentView addSubview:self.myLabel];
    }
    return self;
}

@end
