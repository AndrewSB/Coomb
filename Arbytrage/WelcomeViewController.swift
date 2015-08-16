//
//  WelcomeViewController.swift
//  Arbytrage
//
//  Created by Andrew Breckenridge on 8/16/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit
import Alamofire

class WelcomeViewController: UIViewController {
    
    var selectedCurrency: String?
    @IBOutlet weak var currencyLabel: UILabel!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let selectedCurrency = selectedCurrency {
            currencyLabel.text = "I see you like the \(selectedCurrency). I approve"
        }
    }
    
    @IBAction func didSelectPickCurrency(sender: AnyObject) {
        self.performSegueWithIdentifier("segueToPicker", sender: nil)
    }

    @IBAction func unwindToWelcome(sender: UIStoryboardSegue) {}
}
