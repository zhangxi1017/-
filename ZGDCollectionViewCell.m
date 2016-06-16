

//
//  ZGDCollectionViewCell.m
//  累
//
//  Created by ADAQM on 16/5/18.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import "ZGDCollectionViewCell.h"
#import "ZGDPhoto.h"
#import "ZGDPhotoView.h"

@interface ZGDCollectionViewCell()

@property(nonatomic,strong)ZGDPhotoView *photoView;

@end

@implementation ZGDCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}
- (void)setPhoto:(ZGDPhoto *)photo
{
    _photo = photo;
    self.photoView.photo = photo;
}

- (ZGDPhotoView *)photoView
{
    if (_photoView == nil) {
        _photoView = [[ZGDPhotoView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:_photoView];
    }
    return _photoView;
}
@end
