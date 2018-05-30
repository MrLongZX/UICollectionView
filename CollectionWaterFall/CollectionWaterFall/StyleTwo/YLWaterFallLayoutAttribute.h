//
//  YLLayoutHelper.h
//  GMMall
//
//  Created by 苏友龙 on 2018/5/28.
//  Copyright © 2018年 苏友龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YLWaterFallLayoutAttributeDeleaget<NSObject>

/// 每个item的大小
- (CGSize)sizeForItemAtIndex:(NSUInteger)index;

@end

/** 设置瀑布流item属性、获取item frame、collection内容高度 */
@interface YLWaterFallLayoutAttribute : NSObject

/** 代理 */
@property (nonatomic, weak) id<YLWaterFallLayoutAttributeDeleaget> delegate;

/** 列数 */
@property (nonatomic, assign) CGFloat columnCount;

/** 列间距 */
@property (nonatomic, assign) CGFloat interitemSpacing;

/** 行间距 */
@property (nonatomic, assign) CGFloat lineSpacing;

/** 内间距 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;

/** collection内容的高度 */
@property (nonatomic, assign) CGFloat contentHeight;

/// 获取index上item的frame
- (CGRect)getCollectionItemFrame:(NSUInteger)index;

/// 下拉刷新 还原内容高度初始化
- (void)dealWithColumnHeightArray;

@end
