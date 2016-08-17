

//
//  ImageViewController.m
//  丁丁摄影
//
//  Created by 赵继超 on 16/8/15.
//  Copyright © 2016年 赵继超. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic,strong) UIImageView * imageView;
@end

@implementation ImageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
   _imageView =[[UIImageView alloc] initWithFrame:self.view.frame];
    _imageView.image =self.image;
    
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(doAction:)];
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(doAction:)];
}

- (void)doAction:(UIBarButtonItem *)item{
    if ([item isEqual:self.navigationItem.leftBarButtonItem]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if([item isEqual:self.navigationItem.rightBarButtonItem]){
        UIImagePickerController * pickController =[[UIImagePickerController alloc] init];
        pickController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        pickController.delegate = self;
        
        //是否允许编辑
        pickController.allowsEditing = YES;
        
        [self presentViewController:pickController animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    
    if ([self.delegate respondsToSelector:@selector(changeTheImageView:)]) {
        [self.delegate changeTheImageView:image];
    }
    self.imageView.image =image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
