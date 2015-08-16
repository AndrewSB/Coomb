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
    
    @IBOutlet weak var currencyButton: UIButton!
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var buyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didSwitch()
        
        Alamofire.request(.GET, "http://blockchain.info/ticker")
        .responseJSON {
            let fuckingHackyUSD = (($0.2.value! as! NSDictionary)["USD"]! as! NSDictionary)["15m"]
            print(fuckingHackyUSD)
            
            dispatch_async(dispatch_get_main_queue()) {
                self.currencyButton.setTitle("$\(fuckingHackyUSD!)", forState: .Normal)
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        delay(Double(rand() % 10)) {
            TSMessage.showNotificationWithTitle("yo", type: .Message)
        }
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
