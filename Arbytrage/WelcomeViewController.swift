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
    
    var currency: String! = "BTC" {
        didSet {
            self.currentLabel.text = "Current \(currency) to USD"
        }
    }
    var currencyValue: Double! {
        didSet {
            currencyValue = Double(round(1000*currencyValue)/1000)
            self.currencyButton.setTitle("$\(currencyValue)", forState: UIControlState.Normal)
            self.currencyButton.sizeToFit()
        }
    }
    
    @IBOutlet weak var currentLabel: UILabel!
    
    @IBOutlet weak var currencyButton: UIButton!
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var buyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didSwitch()
        
        currentLabel.text = "Current \(currency) to USD"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        Alamofire.request(.GET, "http://coinmarketcap-nexuist.rhcloud.com/api/\(currency)/price")
            .responseJSON {
                let usd = $0.2.value!["usd"]
                dispatch_async(dispatch_get_main_queue()) {
                    self.currencyValue = (usd as! NSString).doubleValue
                }
        }
        
        delay(Double(rand() % 10)) {
            TSMessage.showNotificationWithTitle("\(self.currency) now at $\(self.currencyValue)! Time to buy.", type: .Success)
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
        switchLabel.text = `switch`.on ? "Auto Buy Notifications" : "Manual Selection"
    }
    
    @IBAction func unwindToWelcome(sender: UIStoryboardSegue) {}
}
