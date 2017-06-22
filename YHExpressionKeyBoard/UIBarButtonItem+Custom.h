//
//  UIBarButtonItem+Custom.h
//  PikeWay
//
//  Created by hkp on 16/11/30.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Custom)

/*
 *默认的左返回按钮
 */
+ (UIBarButtonItem *)backItemWithTarget:(id)target selector:(SEL)selector;

/**********UIBarButtonItem为文字的设置**********/
+ (UIBarButtonItem *)leftItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector;
+ (UIBarButtonItem *)leftItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector block:(void(^)(UIButton *btn))block;

+ (UIBarButtonItem *)rightItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector;
+ (UIBarButtonItem *)rightItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector block:(void(^)(UIButton *btn))block;


/**********UIBarButtonItem为图片的设置**********/
/*
 *通用leftBarItem imgName:图片名 target:目标对象 selector:相应方法
 */
+ (UIBarButtonItem *)leftItemWithImgName:(NSString *)imgName target:(id)target selector:(SEL)selector;

+ (UIBarButtonItem *)leftItemWithImgName:(NSString *)imgName target:(id)target selector:(SEL)selector block:(void(^)(UIButton *btn))block;

/*
 *通用rightBarItem imgName:图片名 target:目标对象 selector:相应方法
 */
+ (UIBarButtonItem *)rightItemWithImgName:(NSString *)imgName target:(id)target selector:(SEL)selector;

+ (UIBarButtonItem *)rightItemWithImgName:(NSString *)imgName target:(id)target selector:(SEL)selector block:(void(^)(UIButton *btn))block;

@end
