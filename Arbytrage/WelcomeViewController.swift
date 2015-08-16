//
//  WelcomeViewController.swift
//  Arbytrage
//
//  Created by Andrew Breckenridge on 8/16/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var segued = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("loaded bish")
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !segued {
            segued = true
            self.performSegueWithIdentifier("segueToPicker", sender: nil)
        }
    }

    @IBAction func unwindToWelcome(sender: UIStoryboardSegue) {}
}
