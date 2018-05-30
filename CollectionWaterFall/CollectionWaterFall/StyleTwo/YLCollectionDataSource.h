//
//  CalendarDataSource.h
//  Calendar
//
//  Created by Ole Begemann on 29.07.13.
//  Copyright (c) 2013 Ole Begemann. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ConfigureCellBlock)(id cell, NSIndexPath *indexPath, id event);

@interface YLCollectionDataSource : NSObject <UICollectionViewDataSource>

/** 复用标识符 */
@property (copy, nonatomic) NSString *reuseIdentifier;

/** 数据源 */
@property (strong, nonatomic) NSMutableArray *events;

/** block */
@property (copy, nonatomic) ConfigureCellBlock configureCellBlock;

/// 返回indexPath上的数据
- (id)eventAtIndexPath:(NSIndexPath *)indexPath;

/// 计算在显示范围内的item
- (NSArray *)indexPathsOfItemsInRect:(CGRect)rect;

@end
