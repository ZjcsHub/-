//
//  ImageViewController.h
//  丁丁摄影
//
//  Created by 赵继超 on 16/8/15.
//  Copyright © 2016年 赵继超. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageViewDelegate <NSObject>

- (void)changeTheImageView:(UIImage *)image;

@end



@interface ImageViewController : UIViewController

@property (nonatomic,strong) UIImage * image;

@property (nonatomic,weak) id<ImageViewDelegate> delegate;

@end
