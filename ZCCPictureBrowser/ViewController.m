//
//  ViewController.m
//  ZCCPictureBrowser
//
//  Created by Laibu tech_2 on 2020/7/11.
//  Copyright © 2020 Laibu tech_2. All rights reserved.
//

#import "ViewController.h"
#import "Base.h"
#import "SDWebImage.h"
#import "ZCCDragPicBrowserView.h"
@interface ViewController ()

@property (nonatomic, strong) ZCCDragPicBrowserView *browserView;
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, strong) NSArray *urlsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 80, 200, 300)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://c.hiphotos.baidu.com/image/pic/item/30adcbef76094b36de8a2fe5a1cc7cd98d109d99.jpg"]];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureClicked)];
    [imageView addGestureRecognizer:tapGesture];
}

- (void)tapGestureClicked {
    if (!_browserView) {
        [self.view addSubview:self.browserView];
    }
}

- (ZCCDragPicBrowserView *)browserView {
    if (!_browserView) {
        _browserView = [[ZCCDragPicBrowserView alloc] initWithPics:self.urlsArray];
        _browserView.frame = CGRectMake(0, 0, KSCREENWIDTH, KSCREENHEIGHT);
    }
    return _browserView;
}

- (NSArray *)urlsArray {
    if (!_urlsArray) {
        _urlsArray = @[
        @"http://h.hiphotos.baidu.com/image/pic/item/7c1ed21b0ef41bd5f2c2a9e953da81cb39db3d1d.jpg",
        @"http://g.hiphotos.baidu.com/image/pic/item/55e736d12f2eb938d5277fd5d0628535e5dd6f4a.jpg",
        @"http://e.hiphotos.baidu.com/image/pic/item/4e4a20a4462309f7e41f5cfe760e0cf3d6cad6ee.jpg",
        @"http://b.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c81b94575cfb93eb13533fa40a2.jpg",
        @"http://e.hiphotos.baidu.com/image/pic/item/4bed2e738bd4b31c1badd5a685d6277f9e2ff81e.jpg",
        @"http://g.hiphotos.baidu.com/image/pic/item/0d338744ebf81a4c87a3add4d52a6059252da61e.jpg",
        @"http://a.hiphotos.baidu.com/image/pic/item/f2deb48f8c5494ee5080c8142ff5e0fe99257e19.jpg",
        @"http://f.hiphotos.baidu.com/image/pic/item/4034970a304e251f503521f5a586c9177e3e53f9.jpg",
        @"http://b.hiphotos.baidu.com/image/pic/item/279759ee3d6d55fbb3586c0168224f4a20a4dd7e.jpg",
        @"http://img2.xkhouse.com/bbs/hfhouse/data/attachment/forum/corebbs/2009-11/2009113011534566298.jpg"];
    }
    return _urlsArray;
}

@end
