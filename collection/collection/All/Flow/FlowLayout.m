//
//  FlowLayout.m
//  collection
//
//  Created by admin on 2018/6/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "FlowLayout.h"

@implementation FlowLayout {
    NSInteger _columnCount;     //列数
    NSInteger _columnSpacing;   //列间距
    NSInteger _rowSpacing;      //行间距
    NSMutableArray *_attributeArray;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    [self basecConfig];
    
    CGFloat itemWidth = (kScreenWidth - 20 - (_columnSpacing * (_columnCount - 1))) / _columnCount;
    CGFloat itemHeight = 100;

    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        CGFloat x = i % _columnCount * (itemWidth + _columnSpacing);
        CGFloat y = i / _columnCount * (itemHeight + _rowSpacing);

        attributes.frame = CGRectMake(x, y, itemWidth, itemHeight);
    
        [_attributeArray addObject:attributes];
    }
}

- (void)basecConfig {
    _columnCount = 3;
    _columnSpacing = 10;
    _rowSpacing = 10;
    _attributeArray = [NSMutableArray array];
}

- (CGSize)collectionViewContentSize {
    return self.collectionView.frame.size;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributeArray;
}

@end
