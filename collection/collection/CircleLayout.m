//
//  CircleLayout.m
//  collection
//
//  Created by admin on 2018/6/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CircleLayout.h"

@implementation CircleLayout{
    NSInteger _itemCount;
    NSMutableArray *_attributeArray;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    _itemCount = [self.collectionView numberOfItemsInSection:0];
    _attributeArray = [NSMutableArray array];

    CGFloat radius = MIN(kScreenWidth - 40, kScreenHeight) / 2;
    CGPoint center = CGPointMake(kScreenWidth / 2, kScreenHeight / 2);
    
    for (int i = 0; i < _itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.size = CGSizeMake(60, 60);

        //求出每个item的坐标
        double x = center.x + cos(2 * M_PI / _itemCount * i) * (radius - 30);
        double y = center.y + sin(2 * M_PI / _itemCount * i) * (radius-30);

        attributes.center = CGPointMake(x, y);
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
