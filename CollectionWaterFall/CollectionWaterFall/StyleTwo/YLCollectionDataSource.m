//
//  CalendarDataSource.m
//  Calendar
//
//  Created by Ole Begemann on 29.07.13.
//  Copyright (c) 2013 Ole Begemann. All rights reserved.
//

#import "YLCollectionDataSource.h"
#import "GMShopOwnerStyleModel.h"

@interface YLCollectionDataSource ()

@end

@implementation YLCollectionDataSource

#pragma mark - 返回indexPath上的数据
- (id)eventAtIndexPath:(NSIndexPath *)indexPath
{
    return self.events[indexPath.item];
}

#pragma mark - 计算在显示范围内的item
- (NSArray *)indexPathsOfItemsInRect:(CGRect)rect
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    [self.events enumerateObjectsUsingBlock:^(GMShopOwnerStyleModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ((CGRectGetMinY(obj.frame) >= CGRectGetMinY(rect) && CGRectGetMaxY(obj.frame) <= CGRectGetMaxY(rect)) ||
            (CGRectGetMinY(obj.frame) <= CGRectGetMinY(rect) && CGRectGetMaxY(obj.frame) >= CGRectGetMinY(rect)) ||
            (CGRectGetMinY(obj.frame) <= CGRectGetMaxY(rect) && CGRectGetMaxY(obj.frame) >= CGRectGetMaxY(rect))) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
            [indexPaths addObject:indexPath];
        }
    }];
    return indexPaths;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.events count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id event = self.events[indexPath.item];
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.reuseIdentifier forIndexPath:indexPath];
    
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, indexPath, event);
    }
    return cell;
}

@end
