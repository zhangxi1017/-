

//
//  ImgItem.m
//  累
//
//  Created by ADAQM on 16/5/18.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import "ImgItem.h"
#import "ZGDPhoto.h"
#import "ZGDPhotoBrowser.h"

@implementation ImgItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)setPhotos:(NSArray<ZGDPhoto *> *)photos
{
    _photos = photos;
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    
    
    ZGDPhotoBrowser *vc = [[ZGDPhotoBrowser alloc] init];
    vc.photos = self.photos;
    vc.currentIndex = tap.view.tag - 100;
    [vc show];
}

@end
