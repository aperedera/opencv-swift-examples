//
//  ViewController.swift
//  OpenCV_1
//
//  Created by Anatoli on 5/25/16.
//  Copyright © 2016 Anatoli Peredera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // A wrapper that can be used to control the camera.  Any frame
    // pre-processing, however, needs to be done in the wrapper's
    // processImage() delegate method in this implementation.
    var videoCameraWrapper : CvVideoCameraWrapper!
    
    @IBOutlet weak var imageView: UIImageView!
    
    /// Start camera.
    @IBAction func actionStart(sender: AnyObject) {
        self.videoCameraWrapper.startCamera()
    }
    
    /// Stop camera.
    @IBAction func actionStop(sender: AnyObject) {
        self.videoCameraWrapper.stopCamera()
    }
    
    /** Initialize the wrapper with this controller's image view to display
     * camera output in it, pre-processed by the delegate's processImage()
     * method.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.videoCameraWrapper = CvVideoCameraWrapper(imageView:imageView)

        // This is not essential...
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 3
    }
}
