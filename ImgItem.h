//
//  ImgItem.h
//  累
//
//  Created by ADAQM on 16/5/18.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGDPhoto;
@interface ImgItem : UIImageView
@property(nonatomic,strong)NSArray<ZGDPhoto *> *photos;
@end
