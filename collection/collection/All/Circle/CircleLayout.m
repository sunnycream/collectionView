//
//  CircleLayout.m
//  collection
//
//  Created by admin on 2018/6/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CircleLayout.h"

@implementation CircleLayout{
    NSMutableArray *_attributeArray;
}

- (void)prepareLayout {
    [super prepareLayout];

     NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    _attributeArray = [NSMutableArray array];

    //半径
    CGFloat radius = MIN(kScreenWidth - 40, kScreenHeight) / 2;

    //圆心
    CGPoint center = CGPointMake(kScreenWidth / 2, kScreenHeight / 2);
//    CGPoint center = self.collectionView.center;

    for (int i = 0; i < itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

        //item大小
        attributes.size = CGSizeMake(60, 60);

        if (itemCount == 1) {
            attributes.center = self.collectionView.center;
        } else {
            //求出每个item的坐标
            double x = center.x + cos(2 * M_PI / itemCount * i) * (radius - 30);
            double y = center.y + sin(2 * M_PI / itemCount * i) * (radius - 30);

            attributes.center = CGPointMake(x, y);
        }
        [_attributeArray addObject:attributes];
    }
}

- (CGSize)collectionViewContentSize {
    return self.collectionView.frame.size;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributeArray;
}

@end
