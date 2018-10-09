//
//  ViewController.h
//  AICloudSample
//================================================================================================================================
//
//  Copyright (c) 2015-2018 VisionStar Information Technology (Shanghai) Co., Ltd. All Rights Reserved.
//  EasyAR is the registered trademark or trademark of VisionStar Information Technology (Shanghai) Co., Ltd in China
//  and other countries for the augmented reality technology developed by VisionStar Information Technology (Shanghai) Co., Ltd.
//
//================================================================================================================================



#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
//step 1: import head file
#import <AICloud/BodyPoseFactory.h>
#import <AICloud/HandGestureFactory.h>


@interface ViewController : UIViewController<AVCaptureVideoDataOutputSampleBufferDelegate>
@property(nonatomic,assign) RecognizeCategory recognizeCategory;
@property(nonatomic,strong) AVCaptureSession *session;
@property(nonatomic,strong) AVCaptureVideoPreviewLayer* previewLayer;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UIView *preView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelHeightConstriant;

@end

