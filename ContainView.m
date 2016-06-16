
//
//  ContainView.m
//  累
//
//  Created by ADAQM on 16/5/16.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import "ContainView.h"
#import "ImgItem.h"
#import "UIImageView+WebCache.h"
#import "ZGDPhoto.h"

@interface ContainView ()

@property(nonatomic,strong)NSMutableArray<ZGDPhoto *> *photoArrM;

@end

@implementation ContainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.photoArrM = [NSMutableArray array];
    }
    return self;
}

- (void)setImagesArr:(NSArray *)imagesArr
{
    _imagesArr = imagesArr;
    
    /**
     *  加载图片
     */
    for (NSInteger i = 0; i < imagesArr.count; i ++) {
        ImgItem *item = [[ImgItem alloc] initWithFrame:[self imgFfameWithIndex:i]];
        [item sd_setImageWithURL:[NSURL URLWithString:imagesArr[i]]];
        item.tag = 100 + i;
        [self addSubview:item];
        
        ZGDPhoto *photo = [[ZGDPhoto alloc] init];
        photo.originImgView = item;
        photo.imageUrlStr = imagesArr[i];
        [self.photoArrM addObject:photo];
        item.photos = self.photoArrM;
    }
}

- (CGRect)imgFfameWithIndex:(NSInteger)index
{
    CGFloat x = index / 3;
    CGFloat y = index % 3;
    CGFloat w = 70;
    CGFloat h = 70;
    CGFloat margin = 10;
    return CGRectMake(x * (w + margin) + 10, y * (h + margin)+ 10, w, h);
}

@end
