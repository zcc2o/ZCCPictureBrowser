//
//  AppDelegate.h
//  ZCCPictureBrowser
//
//  Created by Laibu tech_2 on 2020/7/11.
//  Copyright © 2020 Laibu tech_2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Base.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

#ifdef SystemGreater13
@property (strong, nonatomic) UIWindow *window;
#endif

@end

