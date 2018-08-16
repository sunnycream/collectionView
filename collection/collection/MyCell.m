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
        self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
        [self.contentView addSubview:self.myView];
        
        self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 60, 20)];
        self.myLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.myLabel];
    }
    return self;
}

@end
