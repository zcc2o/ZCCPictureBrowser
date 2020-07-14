//
//  Base.h
//  ZCCPictureBrowser
//
//  Created by Laibu tech_2 on 2020/7/13.
//  Copyright © 2020 Laibu tech_2. All rights reserved.
//

#ifndef Base_h
#define Base_h

#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#define SystemGreater13    SystemVersion >= 13.0

#ifndef KSCREENWIDTH
#define KSCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#endif

#ifndef KSCREENHEIGHT
#define KSCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
#endif

//通过RGB获取颜色
#define KCColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

// 随机颜色
#define KCRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define KCRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#endif /* Base_h */
