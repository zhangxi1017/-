
//
//  ZGDPhotoView.m
//  累
//
//  Created by ADAQM on 16/5/18.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import "ZGDPhotoView.h"
#import "ZGDPhoto.h"
#import "UIImageView+WebCache.h"

@interface ZGDPhotoView()

/**
 用来展示的imgView
 */
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic, weak)UITapGestureRecognizer *singleTap;
@end

@implementation ZGDPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapClick)];
        _singleTap = singleTap;
        [self addGestureRecognizer:singleTap];
    }
    return self;
}
- (void)singleTapClick
{
    [UIView animateWithDuration:.25 animations:^{
        CGRect originRect = [_photo.originImgView.superview convertRect:_photo.originImgView.frame toView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
        self.imgView.frame = originRect;
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        // 发出通知去 dissmissViewController
        [[NSNotificationCenter defaultCenter]postNotificationName:@"touchit" object:self];
    });
}
- (void)setPhoto:(ZGDPhoto *)photo
{
    _photo = photo;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:photo.imageUrlStr]];
    self.imgView.frame = [photo.originImgView.superview convertRect:photo.originImgView.frame toView:self.window];
    [self showImg];
}
- (void)showImg
{
    
    if ([[SDImageCache sharedImageCache] diskImageExistsWithKey:_photo.imageUrlStr]) {
        //取消当前请求防止复用问题
        [self.imgView sd_cancelCurrentImageLoad];
        if (_photo.isFirstShow) {
            _photo.isFirstShow = NO;
            [UIView animateWithDuration:.25 animations:^{
                self.imgView.frame = self.bounds;
            }];
        }else
        {
            [UIView animateWithDuration:0 animations:^{
                self.imgView.frame = self.bounds;
            }];
        }
        return;
    }
    
    if (_photo.isFirstShow) {
        _photo.isFirstShow = NO;
    }
    [UIView animateWithDuration:.25 animations:^{
        self.imgView.frame = self.bounds;
    }];
    
}
- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
        _imgView.userInteractionEnabled = YES;
//        _imgView.contentMode = UIViewContentModeCenter;
        [self addSubview:_imgView];
    }
    return _imgView;
}
@end
