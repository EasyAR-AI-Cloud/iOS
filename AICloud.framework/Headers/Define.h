//================================================================================================================================
//
//  Copyright (c) 2015-2018 VisionStar Information Technology (Shanghai) Co., Ltd. All Rights Reserved.
//  EasyAR is the registered trademark or trademark of VisionStar Information Technology (Shanghai) Co., Ltd in China
//  and other countries for the augmented reality technology developed by VisionStar Information Technology (Shanghai) Co., Ltd.
//
//================================================================================================================================

#import <Foundation/Foundation.h>
#import "BodyPose.h"
#import "HandGesture.h"


typedef NS_ENUM(NSUInteger, RecognizeCategory) {
    RecognizeCategoryBodyPose,
    RecognizeCategoryHandGesture,
};



typedef void(^CompletionHandler)(NSDictionary*,NSError*);
typedef void(^BodyPoseCompletionHandler)(BodyPose*,NSError*);
typedef void(^HandGestureCompletionHandler)(HandGesture*,NSError*);


