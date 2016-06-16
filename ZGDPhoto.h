//
//  ZGDPhoto.h
//  累
//
//  Created by ADAQM on 16/5/18.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZGDPhoto : NSObject
@property(nonatomic,copy)NSString *imageUrlStr;
/**
 *  原来的imgView
 */
@property(nonatomic,strong)UIImageView *originImgView;
/**
 *  是否是第一次显示
 */
@property(nonatomic,assign)BOOL isFirstShow;
@end
