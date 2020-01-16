//
//  ViewController.swift
//  OpenCV_1
//
//  Created by Anatoli on 5/25/16.
//  Copyright © 2016 Anatoli Peredera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Indicates if the video is running, used to set the title of the
    // button and to determine what to do in response to the button
    // being pressed.  Flipped when the button is pressed.
    var videoIsRunning = false {
        didSet {
            if videoIsRunning {
                buttonStartStop.setTitle("Stop", for: .normal)
            } else {
                buttonStartStop.setTitle("Start", for: .normal)
            }
        }
    }
    
    // A wrapper that can be used to control the camera.  Any frame
    // pre-processing, however, needs to be done in the wrapper's
    // processImage() delegate method in this implementation.
    var videoCameraWrapper : CvVideoCameraWrapper!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonStartStop: UIButton!
    
    // Don't want to worry about laying out subviews in landscape orientation,
    // it's just an example.
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get { return .portrait }
    }
    
    /// Start or stop camera, depending on whether it's running.
    @IBAction func actionStartStop() {
        if (!videoIsRunning) {
            self.videoCameraWrapper.startCamera()
        } else {
            self.videoCameraWrapper.stopCamera()
        }
        videoIsRunning = !videoIsRunning
    }
    
    /** Initialize the wrapper with this controller's image view to display
     * camera output in it, pre-processed by the delegate's processImage()
     * method.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.videoCameraWrapper = CvVideoCameraWrapper(imageView:imageView)

        // Setting it here to trigger the property listener to set button title
        videoIsRunning = false
        
        // Position the image and the button.  Since this is just an example, a
        // few things are hard-coded and it's assumed that the subviews with
        // their sizes as defined in the storyboard fit well within the screen.        
        imageView.frame.origin.y = 50
        imageView.frame.origin.x = (view.bounds.width - imageView.frame.width) * 0.5
        buttonStartStop.frame.origin.y = imageView.frame.origin.y
            + imageView.frame.height + 75
        buttonStartStop.frame.origin.x =
            (view.bounds.width - buttonStartStop.frame.width) * 0.5
        
        // This is not essential...
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 2
    }
}
