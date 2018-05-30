//
//  YLLayoutHelper.m
//  GMMall
//
//  Created by 苏友龙 on 2018/5/28.
//  Copyright © 2018年 苏友龙. All rights reserved.
//

#import "YLWaterFallLayoutAttribute.h"

@interface YLWaterFallLayoutAttribute()

/** 存放所有列的当前高度 */
@property (nonatomic, strong) NSMutableArray *columnHeights;

@end

@implementation YLWaterFallLayoutAttribute

- (NSMutableArray *)columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [[NSMutableArray alloc] init];
        [self initColumnHeightArrayContent];
    }
    return _columnHeights;
}

- (void)initColumnHeightArrayContent
{
    for (NSInteger i = 0; i < _columnCount; i++) {
        [_columnHeights addObject:@(_sectionInset.top)];
    }
}

#pragma mark - 下拉刷新 还原内容高度初始化
- (void)dealWithColumnHeightArray
{
    [_columnHeights removeAllObjects];
    [self initColumnHeightArrayContent];
}

#pragma mark - 获取index上item的frame
- (CGRect)getCollectionItemFrame:(NSUInteger)index
{
    // 设置布局属性的frame
    CGSize cellSize;
    if ([self.delegate respondsToSelector:@selector(sizeForItemAtIndex:)]) {
        cellSize = [self.delegate sizeForItemAtIndex:index];
    }
    
    // 找出最短的那一列
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    
    for (int i = 1; i < self.columnCount; i++) {
        // 取得第i列的高度
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    CGFloat cellX = self.sectionInset.left + destColumn * (cellSize.width + self.interitemSpacing);
    CGFloat cellY = minColumnHeight;
    if (cellY != self.sectionInset.top) {
        cellY += self.lineSpacing;
    }
    
    CGRect frame = CGRectMake(cellX, cellY, cellSize.width, cellSize.height);
    // 更新最短那一列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(frame));
    // 记录内容的高度 - 即最长那一列的高度
    CGFloat maxColumnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < maxColumnHeight) {
        self.contentHeight = maxColumnHeight;
    }
    return frame;
}

@end
