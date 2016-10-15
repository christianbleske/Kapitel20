//
//  ViewController.swift
//  ForcedTouchBsp
//
//  Created by Christian Bleske on 19.09.15.
//  Copyright © 2015 Christian Bleske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    if touch.force >= touch.maximumPossibleForce {
                        uiLabel.text = "Über 385 Gramm"
                    } else {
                        let result = touch.force/touch.maximumPossibleForce
                        let calculated = result * 385
                        let rounded = Int(calculated)
                        uiLabel.text = "\(rounded) Gramm"
                    }
            }
        } 

    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        uiLabel.text = "0 Gramm"
    }

}

