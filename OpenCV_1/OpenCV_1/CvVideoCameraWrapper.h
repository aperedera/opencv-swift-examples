//
//  OpenCVWrapper.h
//  OpenCV_1
//
//  Created by Anatoli on 5/25/16.
//  Copyright © 2016 Anatoli Peredera. All rights reserved.
//

#ifndef OpenCVWrapper_h
#define OpenCVWrapper_h

// Need this ifdef, so the C++ header won't confuse Swift
#ifdef __cplusplus
#import <opencv2/opencv.hpp>
#endif

// Can't include this here: it includes headers that must be compiled as C++
// This means that CvVideoCamera can no longer be used in Swift the way
// it could be with older OpenCV releases.
//#import <opencv2/videoio/cap_ios.h>

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * Objective-C++ class that wraps a CvVideoCamera instance and can be set as
 * CvVideoCamera's delegate.
 *
 * The class can be instantiated in Swift code to display camera output in a
 * given UIImageView and to start/stop the camera.  However, frame processing
 * has to be done in (Objective-)C++ in the processImage() method, which is the
 * only method in the CvVideoCameraDelegate protocol.
 *
 * More methods could be added that delegate to the underlying CvVideoCamera.
 */
@interface CvVideoCameraWrapper : NSObject

/**
 * Initialize with a UIImageView that will display frames from the camera.
 *
 * The newly-initialized instance sets itself as the CvVideoCamera's
 * delegate, so the frames displayed in the image view are pre-processed
 * by the processImage() method.
 */
-(id)initWithImageView:(UIImageView*)iv;

/// Start the camera.
-(void)startCamera;

/// Stop the camera.
-(void)stopCamera;

@end

#endif /* OpenCVWrapper_h */
