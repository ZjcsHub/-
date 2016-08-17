//
//  PopupView.m
//  图片点击放大
//
//  Created by 大欢 on 16/6/15.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "PopupView.h"

@interface PopupView ()

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation PopupView

- (UIImageView *)imageView {
    
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
        _imageView.center = self.center;
    }
    return _imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self addTarget:self action:@selector(dissmissPopupView) forControlEvents:UIControlEventTouchUpInside];
        self.hidden = YES;
        [self addSubview:self.imageView];
        
    }
    return self;
}

- (void)showPopupView:(UIImage *)image {
    
    self.hidden = NO;
    self.imageView.image = image;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.bounds = CGRectMake(0, 0, self.frame.size.width, 300);
    }];
}

- (void)dissmissPopupView {
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        self.hidden = YES;
        self.imageView.bounds = CGRectMake(0, 0, 5, 5);
        self.alpha = 1;
    }];
    
}

@end
