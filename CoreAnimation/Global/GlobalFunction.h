//
//  GlobalFunction.h
//  InfoPicker
//
//  Created by Jn_Kindle on 2018/8/10.
//  Copyright © 2018年 JnKindle. All rights reserved.
//

//打印相关
#ifdef DEBUG
#define JNLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define YHLog(...)
#endif

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]

//布局配置
#define JnScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define JnScreenHeight [[UIScreen mainScreen] bounds].size.height
#define JnScreenPercentage JnScreenWidth / 375 //尺寸比例（以iphone6 750 X 1334 为基础）

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>




@interface GlobalFunction : NSObject


+(void)saveValue:(id)Value forKey:(NSString *)key;
+(id)getValueForKey:(NSString *)key;


#pragma mark - UIColor
+ (UIColor *)colorWithHexString:(NSString *)color;

@end
