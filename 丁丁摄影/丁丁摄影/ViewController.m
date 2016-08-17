//
//  ViewController.m
//  丁丁摄影
//
//  Created by 赵继超 on 16/8/14.
//  Copyright © 2016年 赵继超. All rights reserved.
//

#import "ViewController.h"
#import "BaceView.h"
#import "ImageViewController.h"
#import "ButtonView.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define kMargia 10


static NSString * identifier =@"CellId";
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,ImageViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (nonatomic, strong) UICollectionView * collectionView;
@property (weak, nonatomic) IBOutlet BaceView *HeadPortraitsView;

@property (nonatomic, strong) NSUserDefaults * userDe;

@property (nonatomic, strong) ButtonView * buttonView;

@end

@implementation ViewController

- (ButtonView *)buttonView{
    if (!_buttonView) {
        _buttonView =[[ButtonView alloc] initWithFrame:CGRectMake(0, 377, self.view.frame.size.width, 40)];
         _buttonView.backgroundColor =[UIColor whiteColor];
    }
    return _buttonView;
}

- (NSUserDefaults *)userDe{
    if (!_userDe) {
        _userDe =[NSUserDefaults standardUserDefaults];
    }
    return _userDe;
}


- (void)changeTheImageView:(UIImage *)image{
    self.HeadPortraitsView.image =image;
    
    NSData * data =UIImagePNGRepresentation(image);
    
    [self.userDe setObject:data forKey:@"userHeader"];
    [self.userDe synchronize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"个人中心";
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [self addGestureAndImage];
    
    [self.view addSubview:self.buttonView];
    
    [self addCollectionView];
    
    NSLog(@"%@",NSStringFromCGRect(self.buttonView.frame));
}

- (void)addGestureAndImage{
    
    if ([self.userDe objectForKey:@"userHeader"]) {
        UIImage * image =[UIImage imageWithData:[self.userDe objectForKey:@"userHeader"]];
        
        self.HeadPortraitsView.image =image;
    }
    
    UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImage:)];
    
    self.HeadPortraitsView.userInteractionEnabled =YES;
    
    [self.HeadPortraitsView addGestureRecognizer:tap];

}

- (void)showImage:(id)gesture{
    if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
        ImageViewController * imageVc =[[ImageViewController alloc] init];
        
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:imageVc];
        imageVc.image =self.HeadPortraitsView.image;
        
        imageVc.delegate =self;
        
        [self presentViewController:nav animated:YES completion:^{
        }];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
        
    self.HeadPortraitsView.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)addCollectionView{
    UICollectionViewFlowLayout * layout =[[UICollectionViewFlowLayout alloc] init];
    
    NSInteger width =(WIDTH - 3* kMargia) /2;
    layout.itemSize =CGSizeMake(width, width);
    
    layout.sectionInset =UIEdgeInsetsMake(kMargia, kMargia, kMargia, kMargia);
    
    _collectionView =[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    _collectionView.dataSource =self;
    
    _collectionView.delegate =self;

    _collectionView.backgroundColor =[UIColor whiteColor];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    [self.view addSubview:_collectionView];
    
    [self makeConstraint];
}

- (void)makeConstraint{
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buttonView.mas_bottom).offset(10);
        make.bottom.left.right.equalTo(@0);
    }];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    
    return cell;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
