//
//  BaceView.m
//  丁丁摄影
//
//  Created by 赵继超 on 16/8/14.
//  Copyright © 2016年 赵继超. All rights reserved.
//

#import "BaceView.h"

@interface BaceView ()

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property (nonatomic, assign) IBInspectable CGFloat lineWidth;

@property (nonatomic, strong) IBInspectable UIColor * lineColor;
@end


@implementation BaceView


- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    _cornerRadius = cornerRadius;
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setLineWidth:(CGFloat)lineWidth {
    
    _lineWidth = lineWidth;
    
    self.layer.borderWidth = lineWidth;
    
}

-(void)setLineColor:(UIColor *)lineColor {
    
    _lineColor = lineColor;
    
    self.layer.borderColor = lineColor.CGColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
