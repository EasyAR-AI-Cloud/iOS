//
//  ViewController.m
//  AICloudSample
//================================================================================================================================
//
//  Copyright (c) 2015-2018 VisionStar Information Technology (Shanghai) Co., Ltd. All Rights Reserved.
//  EasyAR is the registered trademark or trademark of VisionStar Information Technology (Shanghai) Co., Ltd in China
//  and other countries for the augmented reality technology developed by VisionStar Information Technology (Shanghai) Co., Ltd.
//
//================================================================================================================================



#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initCaptureSession];

    switch (_recognizeCategory) {
        case RecognizeCategoryHandGesture:
            self.navigationItem.title=@"Recognize hand gesture";
            break;
        case RecognizeCategoryBodyPose:
            self.navigationItem.title=@"Recognize body pose";
            break;
        default:
            break;
    }
    
    //step 2:initWithKey
    [BodyPoseFactory initWithKey:@"" andSecret:@""];//add your key and secret
    [HandGestureFactory initWithKey:@"" andSecret:@""];//add your key and secret

}


-(void)viewWillAppear:(BOOL)animated{
    [self.session startRunning];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.session stopRunning];
}

- (void)dealloc
{
    if(self.session)
    {
        for(AVCaptureInput *input in [self.session.inputs copy])
        {
            [self.session removeInput:input];
        }
        for(AVCaptureOutput *output in [self.session.outputs copy])
        {
            [self.session removeOutput:output];
        }
    }
//    captureOutPut = nil;
    self.session = nil;
}

-(bool)initCaptureSession{
    self.session=[[AVCaptureSession alloc] init];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        [self.session setSessionPreset:AVCaptureSessionPreset640x480];
    else
        [self.session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    AVCaptureDevice *videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (!videoDevice) {
        return NO;
    }
    
    NSError *error;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice : videoDevice error : &error];
    if (error) {
        return NO;
    }
    
    if ([self.session canAddInput : deviceInput]) {
        [self.session addInput : deviceInput];
    } else {
        NSLog(@"Could not add input port to capture session %@", self.session);
    }
    
    AVCaptureVideoDataOutput* captureOutPut = [[AVCaptureVideoDataOutput alloc] init];
    captureOutPut.alwaysDiscardsLateVideoFrames = YES;
    NSDictionary *rgbOutputSettings = [NSDictionary dictionaryWithObject:
                                       [NSNumber numberWithInt:kCMPixelFormat_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
    [captureOutPut setVideoSettings:rgbOutputSettings];

    
    dispatch_queue_t queue = dispatch_queue_create("VideoDataOutputQueue", DISPATCH_QUEUE_SERIAL);
    [captureOutPut setSampleBufferDelegate:self queue: queue];
    
    if ([self.session canAddOutput:captureOutPut]) {
        [self.session addOutput:captureOutPut];
    }
    
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    [self.previewLayer setBackgroundColor:[[UIColor blackColor] CGColor]];
    [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    CALayer *rootLayer = [self.preView layer];
    [rootLayer setMasksToBounds:YES];
    [self.previewLayer setFrame:[rootLayer bounds]];
    [rootLayer addSublayer:self.previewLayer];
    return YES;
}

-(void)setTipText:(NSString*)tip{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.tipLabel.text=tip;
    });
}

-(NSString*)dataToJsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                       error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

- (void)captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection;{
    //step 3: call recognizeSampleBuffer
    switch (self.recognizeCategory) {
        case RecognizeCategoryBodyPose:
        {
            [BodyPoseFactory recognizeSampleBuffer:sampleBuffer withCompletionHandler:^(NSDictionary *bodyPose, NSError *error) {
                if (error) {
                    NSLog(@"captureOutput recognizeBodyPoseBySampleBuffer finshed with error:%@",error);
                    [self setTipText:[NSString stringWithFormat:@"%@",error]];
                }else{
                    NSLog(@"captureOutput recognizeBodyPoseBySampleBuffer finshed");
                    [self setTipText:[self dataToJsonString:bodyPose]];
                }
            }];
        }
            break;
        case RecognizeCategoryHandGesture:
        {
            [HandGestureFactory recognizeSampleBuffer:sampleBuffer withCompletionHandler:^(NSDictionary *handGesture, NSError *error) {
                if (error) {
                    NSLog(@"captureOutput recognizeHandGestureBySampleBuffer finshed with error:%@",error);
                }else{
                    [self setTipText:[self dataToJsonString:handGesture]];
                }
            }];
        }
            break;
    }
}
@end
