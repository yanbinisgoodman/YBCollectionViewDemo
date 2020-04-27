//
//  ViewController.m
//  YBCollectionViewDemo
//
//  Created by 氧车乐 on 2020/4/27.
//  Copyright © 2020 yanbin. All rights reserved.
//

#import "ViewController.h"
#import "JSAddOtherCollectionViewCell.h"
#import <objc/message.h>

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView * mineCollection;

@property (nonatomic,strong) NSArray * infoArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _infoArr = @[@"啊啊啊啊",@"啊啊啊啊啊啊啊啊啊啊",@"啊啊啊",@"啊",@"啊啊啊啊啊啊",@"啊啊啊啊啊啊啊啊",@"啊啊啊啊",@"啊啊啊啊啊啊啊啊啊啊",@"啊啊啊",@"啊",@"啊啊啊啊啊啊",@"啊啊啊啊啊啊啊啊",@"啊啊啊啊",@"啊啊啊啊啊啊啊啊啊啊",@"啊啊啊",@"啊",@"啊啊啊啊啊啊",@"啊啊啊啊啊啊啊啊",@"啊啊啊啊",@"啊啊啊啊啊啊啊啊啊啊",@"啊啊啊",@"啊",@"啊啊啊啊啊啊",@"啊啊啊啊啊啊啊啊"];
    
    [self.view addSubview:self.mineCollection];
}


- (UICollectionView *)mineCollection{
    if (!_mineCollection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(15, 5, 2, 15);
        _mineCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width,self.view.frame.size.height) collectionViewLayout:layout];
        _mineCollection.delegate = self;
        _mineCollection.dataSource = self;
        _mineCollection.showsHorizontalScrollIndicator = YES;
        _mineCollection.showsVerticalScrollIndicator = YES;
        _mineCollection.scrollEnabled = YES;
        _mineCollection.backgroundColor = [UIColor whiteColor];
        
        [_mineCollection registerClass:[JSAddOtherCollectionViewCell class] forCellWithReuseIdentifier:@"kReuseIdentifier0"];
        SEL sel = NSSelectorFromString(@"_setRowAlignmentsOptions:");
        if ([_mineCollection.collectionViewLayout respondsToSelector:sel]) {
            ((void(*)(id,SEL,NSDictionary*))objc_msgSend)(_mineCollection.collectionViewLayout,sel,
                                                          @{@"UIFlowLayoutCommonRowHorizontalAlignmentKey":@(NSTextAlignmentLeft),
                                                            @"UIFlowLayoutLastRowHorizontalAlignmentKey" : @(NSTextAlignmentLeft),
                                                            @"UIFlowLayoutRowVerticalAlignmentKey" : @(NSTextAlignmentCenter)});
            
        }
    }
    return _mineCollection;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   
    return _infoArr.count;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //高度计算 建议放在model进行
    CGFloat itemHeight  = [self calculateStrwidthWithStr:_infoArr[indexPath.row] Font:[UIFont systemFontOfSize:14]];
   
    return CGSizeMake(itemHeight+20,40.0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JSAddOtherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kReuseIdentifier0" forIndexPath:indexPath];
    
    
    cell.titleLabel.text = _infoArr[indexPath.row];
    return cell;
}

-(CGFloat )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (float) calculateStrwidthWithStr:(NSString *)str Font: (UIFont *) font
{
    CGRect textRect = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, font.pointSize)
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil];
    
    return ceil(textRect.size.width);
}

@end
