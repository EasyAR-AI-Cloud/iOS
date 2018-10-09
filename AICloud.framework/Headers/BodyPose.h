//================================================================================================================================
//
//  Copyright (c) 2015-2018 VisionStar Information Technology (Shanghai) Co., Ltd. All Rights Reserved.
//  EasyAR is the registered trademark or trademark of VisionStar Information Technology (Shanghai) Co., Ltd in China
//  and other countries for the augmented reality technology developed by VisionStar Information Technology (Shanghai) Co., Ltd.
//
//================================================================================================================================

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,BodyPoseEnum) {
    BodyPoseNone=0,
    BodyPoseTwoHandOnHip=1,
    BodyPoseHandUp=2,
    BodyPoseLiftUp=3,
    BodyPoseL=4,
    BodyPoseX=5,
    BodyPoseKing=6,
};

@interface BodyPose : NSObject
@property(nonatomic,assign)BodyPoseEnum type;
@property(nonatomic,assign)double reliability;
@end
