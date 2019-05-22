//
//  LLCircleViewController.m
//  collection
//
//  Created by admin on 2018/6/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LLCircleViewController.h"
#import "CircleLayout.h"

static NSString *cellID = @"cellID";
@interface LLCircleViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CircleLayout *circleLayout;
@property (nonatomic, assign) NSInteger cellCount;

@end

@implementation LLCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cellCount = 7;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [self.view addSubview:self.collectionView];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCollectionView:)];
    [self.collectionView addGestureRecognizer:tap];
}

#pragma mark - Event response
- (void)tapCollectionView:(UITapGestureRecognizer *)tapGestureRecognizer {
    if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint currentPoint = [tapGestureRecognizer locationInView:tapGestureRecognizer.view];//?
        NSIndexPath *path = [self.collectionView indexPathForItemAtPoint:currentPoint];
        if (path) {
            self.cellCount = self.cellCount - 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:@[path]];
            } completion:^(BOOL finished) {

            }];
        } else {
            self.cellCount = self.cellCount + 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]];
            } completion:^(BOOL finished) {

            }];
        }
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = cell.frame.size.width / 2;
    
    return cell;
}

#pragma mark - 懒加载
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:self.circleLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

- (CircleLayout *)circleLayout {
    if (_circleLayout == nil) {
        _circleLayout = [[CircleLayout alloc] init];
    }
    return _circleLayout;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
