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
    var selectedCurrency: String?
    @IBOutlet weak var currencyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("loaded bish")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedCurrency = selectedCurrency {
            currencyLabel.text = "I see you like the \(selectedCurrency). I approve"
        }
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
