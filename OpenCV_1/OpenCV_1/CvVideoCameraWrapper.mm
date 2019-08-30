//
//  OpenCVWrapper.mm
//  OpenCV_1
//
//  Created by Anatoli on 5/25/16.
//  Copyright © 2016 Anatoli Peredera. All rights reserved.
//

#import "CvVideoCameraWrapper.h"
#import <opencv2/videoio/cap_ios.h>

#import "OpenCV_1-Swift.h"

using namespace cv;

// An extension to conform to the delegate protocol
@interface CvVideoCameraWrapper () <CvVideoCameraDelegate>
@end

@implementation CvVideoCameraWrapper
{
    // A member variable holding the wrapped CvVideoCamera
    CvVideoCamera * videoCamera;
}

-(id)initWithImageView:(UIImageView*)iv
{
    videoCamera = [[CvVideoCamera alloc] initWithParentView:iv];
    
    videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    videoCamera.defaultFPS = 30;
    videoCamera.grayscaleMode = NO;
    
    videoCamera.delegate = self;
    
    return self;
}

// The only method of the CvVideoCameraDelegate protocol, visible only
// to C++ (including Objective-C++) code.
#ifdef __cplusplus 
- (void)processImage:(Mat&)image
{
    // Do some OpenCV stuff with the image
    Mat image_copy;
    cvtColor(image, image_copy, CV_BGRA2BGR);
    
    // invert image
    bitwise_not(image_copy, image_copy);
    cvtColor(image_copy, image, CV_BGR2BGRA);
}
#endif

-(void)startCamera
{
    [videoCamera start];
}

-(void)stopCamera
{
    [videoCamera stop];
}
@end
