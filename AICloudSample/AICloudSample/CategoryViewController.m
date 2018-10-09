//================================================================================================================================
//
//  Copyright (c) 2015-2018 VisionStar Information Technology (Shanghai) Co., Ltd. All Rights Reserved.
//  EasyAR is the registered trademark or trademark of VisionStar Information Technology (Shanghai) Co., Ltd in China
//  and other countries for the augmented reality technology developed by VisionStar Information Technology (Shanghai) Co., Ltd.
//
//================================================================================================================================

#import "CategoryViewController.h"
#import "ViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"Select a recognize category";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didRecognizeHandGestureBtnTouch:(id)sender {
    ViewController* vc=[[ViewController alloc]init];
    vc.recognizeCategory=RecognizeCategoryHandGesture;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)didRecognizeBodyPoseBtnTouch:(id)sender {
    ViewController* vc=[[ViewController alloc]init];
    vc.recognizeCategory=RecognizeCategoryBodyPose;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
