//
//  SweetConfig.h
//  WindBookRead
//
//  Created by 冯剑锋 on 16/2/1.
//  Copyright © 2016年 冯剑锋. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 高德地图key*/
static NSString *const kMAMapKey=@"a45834b768c10ee1ae0e2d578b8364af";

@interface SweetConfig : NSObject

/*----------------------------------------------------------------------------------------*/

/*=============================== (frameAndColor) ========================================*/

/*----------------------------------------------------------------------------------------*/

/**
 *	获取视图宽度
 *
 *	@param 	view 	视图对象
 *
 *	@return	宽度
 */
#define DEF_WIDTH(view) view.bounds.size.width

/**
 *	获取视图高度
 *
 *	@param 	view 	视图对象
 *
 *	@return	高度
 */
#define DEF_HEIGHT(view) view.bounds.size.height

/**
 *	获取视图原点横坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	原点横坐标
 */
#define DEF_LEFT(view) view.frame.origin.x

/**
 *	获取视图原点纵坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	原点纵坐标
 */
#define DEF_TOP(view) view.frame.origin.y

/**
 *	获取视图右下角横坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	右下角横坐标
 */
#define DEF_RIGHT(view) (DEF_LEFT(view) + DEF_WIDTH(view))

/**
 *	获取视图右下角纵坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	右下角纵坐标
 */
#define DEF_BOTTOM(view) (DEF_TOP(view) + DEF_HEIGHT(view))

/**
 *  主屏的宽
 */
#define DEF_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

/**
 *  主屏的高
 */
#define DEF_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

/**
 *  主屏的size
 */
#define DEF_SCREEN_SIZE   [[UIScreen mainScreen] bounds].size

/**
 *  主屏的frame
 */
#define DEF_SCREEN_FRAME  [UIScreen mainScreen].applicationFrame

/**
 *  宽度比例系数
 */
#define DEF_WIDTH_RATIO   [[UIScreen mainScreen] bounds].size.width/320

/**
 *  高度比例系数
 */
#define DEF_HEIGHT_RATIO   [[UIScreen mainScreen] bounds].size.height/568

/**
 *	生成RGB颜色
 *
 *	@param 	red 	red值（0~255）
 *	@param 	green 	green值（0~255）
 *	@param 	blue 	blue值（0~255）
 *
 *	@return	UIColor对象
 */
#define DEF_RGB_COLOR(_red, _green, _blue) [UIColor colorWithRed:(_red)/255.0f green:(_green)/255.0f blue:(_blue)/255.0f alpha:1]

/**
 *	生成RGBA颜色
 *
 *	@param 	red 	red值（0~255）
 *	@param 	green 	green值（0~255）
 *	@param 	blue 	blue值（0~255）
 *	@param 	alpha 	blue值（0~1）
 *
 *	@return	UIColor对象
 */
#define DEF_RGBA_COLOR(_red, _green, _blue, _alpha) [UIColor colorWithRed:(_red)/255.0f green:(_green)/255.0f blue:(_blue)/255.0f alpha:(_alpha)]
/**
 *  灰色
 */
#define grayColor @"999999"
/*!
 *  褐色
 */
#define brownColor @"A7884A"


//黑色
#define DEF_COLOR_BLACK @"2F2F2F"
//浅灰色
#define DEF_COLOR_LIGHT_GRAY @"EBEBEB"
//深灰色
#define DEF_COLOR_DARK_GRAY @"DFDFDF"
//深金色
#define DEF_COLOR_DARK_GOLD @"D0A245"
//浅金色
#define DEF_COLOR_LIGHT_GOLD @"E9AD2A"


/**
 *	生成RGB颜色
 *
 *	@param 	rgb 	RGB颜色值（必须0x开头，例如:0xffffff）
 *
 *	@return	UIColor对象
 */
#define DEF_RGBString_COLOR(rgb) [UIColor colorWithRGB:rgb]

/**
 *  返回颜色
 *
 *  @param color 字符串的16进制的颜色
 *
 *  @return UIColor对象
 */
#define getColor(color) [UIColor colorWithRed:((float)((strtoul([color UTF8String],0,16) & 0xFF0000) >> 16))/255.0 green:((float)((strtoul([color UTF8String],0,16) & 0xFF00) >> 8))/255.0 blue:((float)(strtoul([color UTF8String],0,16) & 0xFF))/255.0 alpha:1.0]

/**
 *	生成RGBA颜色
 *
 *	@param 	string 	颜色描述字符串，带“＃”开头
 *
 *	@return	UIColor对象
 */
#define DEF_STRING_COLOR(string) [UIColor colorWithString:string]

/**
 *  判断屏幕尺寸是否为640*960
 *
 *	@return	判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_640_960 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  判断屏幕尺寸是否为640*1136
 *
 *	@return	判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_640_1136 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  判断屏幕尺寸是否为750*1334
 *
 *	@return	判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_750_1334 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  判断屏幕尺寸是否为828*1472
 *
 *	@return	判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_1242_2208 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  判断是否为ios7
 *
 *	@return	判断结果（YES:是 NO:不是）
 */
#define system_7 ([[[UIDevice currentDevice] systemVersion] floatValue])>= 7.0

#define system_8 ([[[UIDevice currentDevice] systemVersion] floatValue])>= 8.0

#define isIhpone5  ([UIScreen mainScreen].bounds.size.height>=568)

#define TabbarAndNavHeight 113

/*----------------------------------------------------------------------------------------*/

/*===============================    (文字大小)    ========================================*/

/*----------------------------------------------------------------------------------------*/

//通用字号
#define DEF_FontSize_18 [UIFont systemFontOfSize:18]
#define DEF_FontSize_17 [UIFont systemFontOfSize:17]
#define DEF_FontSize_16 [UIFont systemFontOfSize:16]
#define DEF_FontSize_15 [UIFont systemFontOfSize:15]
#define DEF_FontSize_14 [UIFont systemFontOfSize:14]
#define DEF_FontSize_13 [UIFont systemFontOfSize:13]
#define DEF_FontSize_12 [UIFont systemFontOfSize:12]
#define DEF_FontSize_11 [UIFont systemFontOfSize:11]
#define DEF_FontSize_10 [UIFont systemFontOfSize:10]

/*----------------------------------------------------------------------------------------*/

/*===============================     (数据存储)   ========================================*/

/*----------------------------------------------------------------------------------------*/


/**
 *	永久存储对象
 *
 *  NSUserDefaults保存的文件在tmp文件夹里
 *
 *	@param	object      需存储的对象
 *	@param	key         对应的key
 */
#define DEF_PERSISTENT_SET_OBJECT(object, key)                                                                                                 \
({                                                                                                                                             \
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];                                                                          \
[defaults setObject:object forKey:key];                                                                                                    \
[defaults synchronize];                                                                                                                    \
})

/**
 *	取出永久存储的对象
 *
 *	@param	key     所需对象对应的key
 *	@return	key     所对应的对象
 */
#define DEF_PERSISTENT_GET_OBJECT(key)  [[NSUserDefaults standardUserDefaults] objectForKey:key]


/**
 *  清除 NSUserDefaults 保存的所有数据
 */
#define DEF_PERSISTENT_REMOVE_ALLDATA   [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]]


/**
 *  清除 NSUserDefaults 保存的指定数据
 */
#define DEF_PERSISTENT_REMOVE(_key)                                         \
({                                                                          \
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];       \
[defaults removeObjectForKey:_key];                                     \
[defaults synchronize];                                                 \
})

#ifdef DEBUG
// DEBUG模式下进行调试打印

// 输出结果标记出所在类方法与行数
#define DEBUGLog(fmt, ...)   NSLog((@"%s[Line: %d]™ " fmt), strrchr(__FUNCTION__,'['), __LINE__, ##__VA_ARGS__)

#else

#define DEBUGLog(...)   {}

#endif

@end
