//
//  GMShopOwnerStyleModel.h
//  GMMall
//
//  Created by guimi on 2018/5/28.
//  Copyright © 2018年 苏友龙. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 店主风采 model  */
@interface GMShopOwnerStyleModel : NSObject

/** 昵称 */
@property (nonatomic, copy) NSString *name;

/** 人气 */
@property (nonatomic, copy) NSString *popular;

/** 位置 */
@property (nonatomic, assign) CGRect frame;

@end
