//================================================================================================================================
//
//  Copyright (c) 2015-2018 VisionStar Information Technology (Shanghai) Co., Ltd. All Rights Reserved.
//  EasyAR is the registered trademark or trademark of VisionStar Information Technology (Shanghai) Co., Ltd in China
//  and other countries for the augmented reality technology developed by VisionStar Information Technology (Shanghai) Co., Ltd.
//
//================================================================================================================================

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,HandGestureEnum) {
    HandGestureNone=0,
    HandGestureHeart=1<<0,//比心
    HandGestureGun=1<<1,//手枪
};

@interface HandGesture : NSObject
@property(nonatomic,assign)HandGestureEnum type;
@property(nonatomic,assign)double reliability;
@end
