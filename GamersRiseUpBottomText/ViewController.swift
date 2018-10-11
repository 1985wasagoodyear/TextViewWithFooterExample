//
//  ViewController.swift
//  GamersRiseUpBottomText
//
//  Created by Kevin Yu on 10/11/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    // 1.
    // these two are connected by basic constraints
    // bottom-to-top is 0
    // matching leading and trailing constraints
    // the rest is just to fit in with the rest of components
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 2.
        // set VC as delegate, set the below two properties
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
    }
    
    // 3.
    // setup delegate method to change and move elements around
    // as the user types
    func textViewDidChange(_ textView: UITextView) {
        // change size of textView to fit text
        let width = textView.frame.size.width
        let newHeight = textView.sizeThatFits(CGSize(width: width,
                                                   height: CGFloat(MAXFLOAT))).height
        var newFrame = textView.frame
        newFrame.size = CGSize(width: width,
                               height: newHeight)
        textView.frame = newFrame
        
        // move things down, below
        // a containerView/stackView are good
        self.bottomView.frame = CGRect(x: newFrame.origin.x,
                                       y: newFrame.origin.y + newFrame.size.height,
                                       width: self.bottomView.frame.width,
                                       height: self.bottomView.frame.height)
    }

}

