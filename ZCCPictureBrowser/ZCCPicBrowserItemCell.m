//
//  ZCCPicBrowserItemCell.m
//  ZCCPictureBrowser
//
//  Created by Laibu tech_2 on 2020/7/14.
//  Copyright © 2020 Laibu tech_2. All rights reserved.
//

#import "ZCCPicBrowserItemCell.h"
#import "SDWebImage.h"
#import "Base.h"

@interface ZCCPicBrowserItemCell ()

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *imgView;

@end

@implementation ZCCPicBrowserItemCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%s", __func__);
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%s", __func__);
        [self loadSubViews];
    }
    return self;
}

- (void)cellWithImgUrl:(NSString *)imgUrl {
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        CGRect imageRect = [self getSizeWithImage:image];
        self.imgView.frame = imageRect;
        self.scrollView.contentSize = imageRect.size;
    }];
}

- (CGRect)getSizeWithImage:(UIImage *)image {
    CGRect imgViewRect = CGRectZero;
    CGFloat x, y, width, height;
    x = y = width = height = 0;
    // 屏幕宽高比
    CGFloat screenAspectRatio = KSCREENWIDTH / KSCREENHEIGHT; // 350 / 700
    if (image.size.width <= KSCREENWIDTH && image.size.height <= KSCREENHEIGHT) {
        width = image.size.width;
        height = image.size.height;
    } else {
        CGFloat imageAspectRatio = image.size.width / image.size.height;
        if (imageAspectRatio < screenAspectRatio) {
            // 长图
            if (imageAspectRatio < 0.3) {
                width = KSCREENWIDTH;
                height = KSCREENWIDTH * image.size.height / image.size.width;
            } else {
                height = KSCREENHEIGHT;
                width = image.size.width * KSCREENHEIGHT / image.size.height;
            }
        } else {
            if (imageAspectRatio > 3) {
                // 宽图
                height = KSCREENHEIGHT;
                width = image.size.width * KSCREENHEIGHT / image.size.height;
            } else {
                width = KSCREENWIDTH;
                height = KSCREENWIDTH * image.size.height / image.size.width;
            }
        }
    }
    x = ABS(KSCREENWIDTH - width) / 2;
    y = ABS(KSCREENHEIGHT - height) / 2;
    imgViewRect = CGRectMake(x, y, width, height);
    return imgViewRect;
}

- (void)loadSubViews {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    scrollView.bounces = NO;
    [self.contentView addSubview:scrollView];
    _scrollView = scrollView;
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [scrollView addSubview:imgView];
    _imgView = imgView;
}

@end
