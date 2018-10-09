//================================================================================================================================
//
//  Copyright (c) 2015-2018 VisionStar Information Technology (Shanghai) Co., Ltd. All Rights Reserved.
//  EasyAR is the registered trademark or trademark of VisionStar Information Technology (Shanghai) Co., Ltd in China
//  and other countries for the augmented reality technology developed by VisionStar Information Technology (Shanghai) Co., Ltd.
//
//================================================================================================================================

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Define.h"


@interface BodyPoseFactory : NSObject

+(BOOL) initWithKey:(NSString*)key andSecret:(NSString*)secret;

+(void) recognizeSampleBuffer:(CMSampleBufferRef)sampleBuffer withCompletionHandler:(CompletionHandler)finish;

+(void) recognizeImage:(UIImage*)image withCompletionHandler:(CompletionHandler)finish;

@end
