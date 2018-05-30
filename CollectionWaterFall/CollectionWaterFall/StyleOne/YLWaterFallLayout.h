//
//  YLWaterFallLayout
//  GMMall
//
//  Created by guimi on 2018/5/22.
//  Copyright © 2018年 苏友龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YLWaterFallLayout;

@protocol YLWaterFallLayoutDeleaget<NSObject>

@required

/// 每个item的高度
- (CGFloat)waterFallLayout:(YLWaterFallLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth;

@optional

/// 有多少列
- (NSUInteger)columnCountInWaterFallLayout:(YLWaterFallLayout *)waterFallLayout;

/// 每列之间的间距
- (CGFloat)columnMarginInWaterFallLayout:(YLWaterFallLayout *)waterFallLayout;

/// 每行之间的间距
- (CGFloat)rowMarginInWaterFallLayout:(YLWaterFallLayout *)waterFallLayout;

/// 每个item的内边距
- (UIEdgeInsets)edgeInsetdInWaterFallLayout:(YLWaterFallLayout *)waterFallLayout;

@end

@interface YLWaterFallLayout : UICollectionViewLayout
/** 代理 */
@property (nonatomic, weak) id<YLWaterFallLayoutDeleaget> delegate;

@end
