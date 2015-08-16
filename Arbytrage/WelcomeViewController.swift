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
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var buyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didSwitch()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    @IBAction func didSelectPickCurrency(sender: AnyObject) {
        self.performSegueWithIdentifier("segueToPicker", sender: nil)
    }

    @IBAction func didHitManualBuy() {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "https://blockchain.info/wallet/login")!)
    }
    
    @IBAction func didSwitch() {
        buyButton.hidden = `switch`.on
        switchLabel.text = `switch`.on ? "Auto Buy" : "Manual Selection"
    }
    
    @IBAction func unwindToWelcome(sender: UIStoryboardSegue) {}
}
