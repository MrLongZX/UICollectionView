//
//  GMShopOwnerStyleViewController.m
//  GMMall
//
//  Created by guimi on 2018/5/26.
//  Copyright © 2018年 苏友龙 All rights reserved.
//

#import "GMShopOwnerStyleViewController.h"
#import "GMShopOwnerStyleCollectionViewCell.h"
#import "YLWaterFallLayout.h"

static NSString *kIdentifier = @"collectionIdentifier";

@interface GMShopOwnerStyleViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, YLWaterFallLayoutDeleaget>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation GMShopOwnerStyleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"方式一";
    
    [self initViews];
}

- (void)initViews
{
    [self.view addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 500;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GMShopOwnerStyleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark  - LMHWaterFallLayoutDeleaget
- (NSUInteger)columnCountInWaterFallLayout:(YLWaterFallLayout *)waterFallLayout
{
    return 2;
}

- (CGFloat)waterFallLayout:(YLWaterFallLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth
{
    if (indexPath % 2 == 0) {
        return 200;
    } else {
        return 250;
    }
}

- (CGFloat)rowMarginInWaterFallLayout:(YLWaterFallLayout *)waterFallLayout
{
    return 16;
}

- (CGFloat)columnMarginInWaterFallLayout:(YLWaterFallLayout *)waterFallLayout
{
    return 16;
}

- (UIEdgeInsets)edgeInsetdInWaterFallLayout:(YLWaterFallLayout *)waterFallLayout
{
    return UIEdgeInsetsMake(16, 16, 0, 16);
}

#pragma mark - 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        YLWaterFallLayout *fallLayout = [[YLWaterFallLayout alloc] init];
        fallLayout.delegate = self;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fallLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = YES;
        [_collectionView registerClass:[GMShopOwnerStyleCollectionViewCell class] forCellWithReuseIdentifier:kIdentifier];
    }
    return _collectionView;
}

- (void)dealloc
{
    NSLog(@"%@ is dealloc",[self class]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
