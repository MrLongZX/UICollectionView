//
//  GMShopOwnerStyleViewController.m
//  GMMall
//
//  Created by guimi on 2018/5/26.
//  Copyright © 2018年 苏友龙 All rights reserved.
//

#import "GMShopOwnerStyleViewController2.h"
#import "GMShopOwnerStyleCollectionViewCell.h"
#import "GMShopOwnerStyleModel.h"
#import "YLWaterFallLayout2.h"
#import "YLWaterFallLayoutAttribute.h"
#import "YLCollectionDataSource.h"

static NSString *kIdentifier = @"collectionIdentifier";

@interface GMShopOwnerStyleViewController2 ()<UICollectionViewDelegate, UICollectionViewDataSource, YLWaterFallLayoutAttributeDeleaget>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) YLWaterFallLayout2 *waterFallLayout;
@property (nonatomic, strong) YLWaterFallLayoutAttribute *waterFallLayoutAttribute;
@property (nonatomic, strong) YLCollectionDataSource *dataSource;

@end

@implementation GMShopOwnerStyleViewController2

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"方式二";
    _dataArray = [[NSMutableArray alloc] init];
   
    [self initViews];
    [self bindViewModel];
}

- (void)initViews
{
    [self.view addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)bindViewModel
{
    for (NSInteger i = 0; i <= 500; i++) {
        GMShopOwnerStyleModel *model = [[GMShopOwnerStyleModel alloc] init];
        model.name = [NSString stringWithFormat:@"昵称：%ld",i];
        model.popular = @"人气7888";
        // 根据设置的属性，计算item的frame
        model.frame = [_waterFallLayoutAttribute getCollectionItemFrame:i];
        [_dataArray addObject:model];
    }
    // 设置collection的内容高度
    _waterFallLayout.contentHeight = _waterFallLayoutAttribute.contentHeight;
    _dataSource.events = _dataArray;
    [_collectionView reloadData];
}

#pragma mark - 设置数据源
- (YLCollectionDataSource *)dataSource
{
    if (!_dataSource){
        _dataSource = [[YLCollectionDataSource alloc] init];
        _dataSource.reuseIdentifier = kIdentifier;
        _dataSource.configureCellBlock = ^(GMShopOwnerStyleCollectionViewCell *cell, NSIndexPath *indexPath, GMShopOwnerStyleModel *event) {
            [cell setDataModel:event];
        };
    }
    return _dataSource;
}

#pragma mark - YLWaterFallLayoutAttributeDeleaget
// 返回item的大小
- (CGSize)sizeForItemAtIndex:(NSUInteger)index
{
    CGFloat itemH;
    if (index % 2 == 0) {
        itemH = 200;
    } else {
        itemH = 250;
    }
    return CGSizeMake((self.view.frame.size.width - 3 * 16) / 2, itemH);
}

#pragma mark --- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        // layout
        _waterFallLayout = [[YLWaterFallLayout2 alloc] init];
        // 设置属性
        _waterFallLayoutAttribute = [[YLWaterFallLayoutAttribute alloc] init];
        _waterFallLayoutAttribute.delegate = self;
        _waterFallLayoutAttribute.columnCount = 2;
        _waterFallLayoutAttribute.lineSpacing = 16;
        _waterFallLayoutAttribute.interitemSpacing = 16;
        _waterFallLayoutAttribute.sectionInset = UIEdgeInsetsMake(16, 16, 0, 16);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_waterFallLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self.dataSource;
        
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
