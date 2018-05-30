//
//  GMShopCollectionViewCell
//  shopTest
//
//  Created by 苏友龙 on 2018/4/24.
//  Copyright © 2018年 moral. All rights reserved.
//

#import "GMShopOwnerStyleCollectionViewCell.h"
#import "GMShopOwnerStyleModel.h"

@interface GMShopOwnerStyleCollectionViewCell()

/** image */
@property (nonatomic, strong) UIImageView *imageView;
/** goods name */
@property (nonatomic, strong) UILabel *nameLabel;
/** price */
@property (nonatomic, strong) UILabel *popularLabel;

@end

@implementation GMShopOwnerStyleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createViews];
    }
    return self;
}

- (void)setDataModel:(GMShopOwnerStyleModel *)model
{
    _nameLabel.text = model.name;
    _popularLabel.text = model.popular;
}

- (void)createViews
{
    [self addSubview:self.popularLabel];
    [_popularLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 16));
    }];
    
    [self addSubview:self.nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_popularLabel.mas_top);
        make.left.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 20));
    }];
    
    [self addSubview:self.imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.mas_equalTo(self.frame.size.width);
        make.bottom.equalTo(_nameLabel.mas_top);
    }];
    
}

#pragma mark - 懒加载
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor redColor];
    }
    return _imageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

- (UILabel *)popularLabel
{
    if (!_popularLabel) {
        _popularLabel = [[UILabel alloc] init];
        _popularLabel.font = [UIFont systemFontOfSize:12];
    }
    return _popularLabel;
}

@end
