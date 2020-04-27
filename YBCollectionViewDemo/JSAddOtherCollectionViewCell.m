//
//  JSAddOtherCollectionViewCell.m
//  MelonBaseProject
//
//  Created by 氧车乐 on 2020/4/7.
//  Copyright © 2020 Melon. All rights reserved.
//

#import "JSAddOtherCollectionViewCell.h"
#import "Masonry.h"
@implementation JSAddOtherCollectionViewCell


- (instancetype)init{
    abort();
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
 
        [self setup];
    }
    
    return self;
}

- (void)setup{
    
    _setView = [UIView new];
    _setView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_setView];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.backgroundColor = [UIColor redColor];
    [_setView addSubview:_titleLabel];
    
}


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wimplicit-retain-self"
- (void)updateConstraints{
    
    [_setView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.contentView);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_setView).offset(10);
        make.centerY.equalTo(_setView);
        make.width.equalTo(self);
        make.height.mas_offset(35);
    }];
    
    [super updateConstraints];
}
#pragma clang diagnostic pop

- (void)didMoveToSuperview{
    [self setNeedsUpdateConstraints];
}
@end

