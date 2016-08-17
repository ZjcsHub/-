//
//  ButtonView.m
//  丁丁摄影
//
//  Created by 赵继超 on 16/8/16.
//  Copyright © 2016年 赵继超. All rights reserved.
//

#import "ButtonView.h"

@interface ButtonView ()

@property (nonatomic ,strong) UIButton * leftButton, * centetButton, * rightButton;



@end

@implementation ButtonView

-(UIView *)subView{
    if (!_subView) {
        _subView =[[UIView alloc] initWithFrame:CGRectMake(self.center.x-90, self.frame.size.height-5, 60, 3)];
        _subView.backgroundColor =[UIColor orangeColor];
    }
    return _subView;
}

- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton =[UIButton buttonWithType:UIButtonTypeSystem];
        [_leftButton setTitle:@"图博" forState:UIControlStateNormal];
        
        _leftButton.frame =CGRectMake(self.center.x-90,0,60 , self.frame.size.height-5);
        
        [_leftButton addTarget:self action:@selector(moveAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}
- (UIButton *)centetButton{
    if (!_centetButton) {
        _centetButton =[UIButton buttonWithType:UIButtonTypeSystem];
        [_centetButton setTitle:@"资料" forState:UIControlStateNormal];
        _centetButton.frame =CGRectMake(self.center.x-30, 0, 60, self.frame.size.height-5);
        [_centetButton addTarget:self action:@selector(moveAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _centetButton;
}
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton =[UIButton buttonWithType:UIButtonTypeSystem];
        [_rightButton setTitle:@"约片" forState:UIControlStateNormal];
         _rightButton.frame =CGRectMake(self.center.x+30, 0, 60, self.frame.size.height-5);
        [_rightButton addTarget:self action:@selector(moveAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _rightButton;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self ==[super initWithFrame:frame]) {
        [self addSubview:self.subView];
        [self addSubview:self.leftButton];
        [self addSubview:self.centetButton];
        [self addSubview:self.rightButton];
//        self.backgroundColor =[UIColor whiteColor];
    }
    return self;
}

- (void)moveAction:(UIButton *)button{
    [UIView animateWithDuration:0.1 animations:^{
        CGRect rect = self.subView.frame;
        rect.origin.x =button.frame.origin.x;
        self.subView.frame =rect;
    }];
}





// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath * path =[UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, self.frame.size.height-1)];
    
    [path addLineToPoint:CGPointMake(self.frame.size.width,self.frame.size.height-1)];
    
    path.lineWidth =1;
    
    [[UIColor grayColor] set];
    
    [path stroke];
    

}


@end
