//
//  WeekCalendarLayout.m
//  Calendar
//
//  Created by 苏友龙 on 29.07.13.
//  Copyright (c) 2013 苏友龙. All rights reserved.
//

#import "YLWaterFallLayout2.h"
#import "GMShopOwnerStyleModel.h"
#import "YLCollectionDataSource.h"

@implementation YLWaterFallLayout2

#pragma mark - UICollectionViewLayout Implementation
// 返回collection内容大小
- (CGSize)collectionViewContentSize
{
    CGFloat contentWidth = self.collectionView.bounds.size.width;
    CGSize contentSize = CGSizeMake(contentWidth, self.contentHeight);
    return contentSize;
}

// 返回显示范围内元素的布局属性对象
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    
    // 计算在显示范围内的item
    YLCollectionDataSource *dataSource = self.collectionView.dataSource;
    NSArray *visibleIndexPaths = [dataSource indexPathsOfItemsInRect:rect];
    
    for (NSIndexPath *indexPath in visibleIndexPaths) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [layoutAttributes addObject:attributes];
    }
    return layoutAttributes;
}

// 返回在indexPath上的item的布局属性对象
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YLCollectionDataSource *dataSource = self.collectionView.dataSource;
    GMShopOwnerStyleModel *model = [dataSource eventAtIndexPath:indexPath];
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = model.frame;
    return attributes;
}

// 当collection bounds发生改变时 是否重新计算布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    CGRect oldBounds = self.collectionView.bounds;
    if (CGRectGetWidth(newBounds) != CGRectGetWidth(oldBounds)) {
        return YES;
    }
    return NO;
}

@end
