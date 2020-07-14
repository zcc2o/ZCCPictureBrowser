//
//  ZCCDragPicBrowserView.m
//  ZCCPictureBrowser
//
//  Created by Laibu tech_2 on 2020/7/14.
//  Copyright © 2020 Laibu tech_2. All rights reserved.
//

#import "ZCCDragPicBrowserView.h"
#import "Base.h"
#import "ZCCPicBrowserItemCell.h"

@interface ZCCDragPicBrowserView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

static NSString *cellIdentifier = @"cellIdentifier";

@implementation ZCCDragPicBrowserView

- (instancetype)initWithPics:(NSArray *)pics
{
    self = [super init];
    if (self) {
        [self loadSubviews];
        [self loadDataWithPics:pics];
    }
    return self;
}

- (void)loadDataWithPics:(NSArray *)pics {
    [self.dataArray addObjectsFromArray:pics];
}

- (void)loadSubviews {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(KSCREENWIDTH, KSCREENHEIGHT);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, KSCREENHEIGHT) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.pagingEnabled = YES;
    [collectionView registerClass:[ZCCPicBrowserItemCell class] forCellWithReuseIdentifier:cellIdentifier];
    [self addSubview:collectionView];
    collectionView.backgroundColor = KCRGBAColor(1, 1, 1, 0.1);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZCCPicBrowserItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell cellWithImgUrl:self.dataArray[indexPath.row]];
    return cell;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

@end
