//
//  ZGDPhotoBrowser.m
//  累
//
//  Created by ADAQM on 16/5/18.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import "ZGDPhotoBrowser.h"
#import "ZGDPhoto.h"
#import "ZGDCollectionViewCell.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
static NSString *const indentifier = @"cell";
@interface ZGDPhotoBrowser ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionview;
@end

@implementation ZGDPhotoBrowser

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionview];
    NSLog(@"%d",self.currentIndex);
    /**
     *  记录是不是第一次显示
     */
    for (NSInteger i = 0; i < self.photos.count; i ++) {
        ZGDPhoto *photo = self.photos[i];
        if (self.currentIndex == i) {
            photo.isFirstShow = YES;
        }else
        {
            photo.isFirstShow = NO;
        }
    }
    [self setupAddObserve];
}
-(void)setupAddObserve{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dismissVC) name:@"touchit" object:nil];
    //    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(longTapWithInfo:) name:@"longTap" object:nil];
}
/// 点击屏幕操作
-(void)dismissVC{
    //    [_padgeControl removeFromSuperview];
    
    [UIView animateWithDuration:.25 animations:^{
        self.view.backgroundColor = [UIColor clearColor];
        _collectionview.backgroundColor = [UIColor clearColor];
    }completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}
- (void)setPhotos:(NSArray<ZGDPhoto *> *)photos
{
    _photos = photos;
    
}
- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.view];
    [window.rootViewController addChildViewController:self];
}
- (UICollectionView *)collectionview
{
    if (_collectionview == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(screenWidth, screenHeight);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionview = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        [_collectionview registerClass:[ZGDCollectionViewCell class] forCellWithReuseIdentifier:indentifier];
        _collectionview.contentOffset = CGPointMake(self.currentIndex * screenWidth, 0);
        _collectionview.pagingEnabled = YES;
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        [self.view addSubview:_collectionview];
    }
    return _collectionview;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZGDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];
    cell.photo = self.photos[indexPath.item];
    return cell;
}

@end
