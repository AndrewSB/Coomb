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
    
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var buyButton: UIButton!
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let selectedCurrency = selectedCurrency {
            currencyLabel.text = "I see you like the \(selectedCurrency). I approve"
        }
    }
    
    @IBAction func didSelectPickCurrency(sender: AnyObject) {
        self.performSegueWithIdentifier("segueToPicker", sender: nil)
    }

    @IBAction func didHitManualBuy() {
        UIView.animateWithDuration(0.2) {
            self.buyButton.frame = 
            UIView.animateWithDuration(0.5) {
                self.buyButton.alpha = 1
            }
        }
    }
    
    
    @IBAction func unwindToWelcome(sender: UIStoryboardSegue) {}
}
