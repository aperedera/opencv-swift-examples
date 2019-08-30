# opencv-swift-examples
Miscellaneous sample Swift projects using OpenCV. 

OpenCV_1

An example of using CvVideoCamera and CvVideoCameraDelegate in a Swift project.  Inspired by https://stackoverflow.com/questions/37413951/video-processing-with-opencv-in-ios-swift-project/37427098?noredirect=1#comment101387705_37427098.  Adding this code on GitHub at the community request.

This sample assumes that frame pre-processing is done in C++, though the processed frames are displayed in a Swift app.

The UI is very primitive and not production quality, sorry.  The focus of the sample is to demo wrapping of the OpenCV framework for use in Swift for frame pre-processing.

The easiest way to incorporate the OpenCV framework is to download it as described on the opencv.org website and drag it from Finder into the Xcode project.  Please make sure to check 'Copy items as needed', unless the framework is located in the folder containing OpenCV_1.xcodeproj.  You can choose either 'Create groups' or 'Create folder references.'
