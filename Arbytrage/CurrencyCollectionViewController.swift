//
//  CurrencyCollectionViewController.swift
//  Arbytrage
//
//  Created by Andrew Breckenridge on 8/16/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit
import Alamofire

class CurrencyCollectionViewController: UIViewController {
    @IBOutlet weak var lolCollectionView: UICollectionView!
    
    var data: [(String, Double)] = [
        ("BTC", 0),
        ("CLAM", 0),
        ("PRO", 0),
        ("BANX", 0)
        ] { didSet {
            self.lolCollectionView.reloadData()
        }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://coinmarketcap-nexuist.rhcloud.com/api/banx/price")
            .responseJSON {
                let usd = $0.2.value!["usd"]
                dispatch_async(dispatch_get_main_queue()) {
                    self.data[2].1 = (usd as! NSString).doubleValue
                }
                
                Alamofire.request(.GET, "http://coinmarketcap-nexuist.rhcloud.com/api/pro/price")
                    .responseJSON {
                        let usd = $0.2.value!["usd"]
                        dispatch_async(dispatch_get_main_queue()) {
                            self.data[3].1 = (usd as! NSString).doubleValue
                        }
                }
                
                Alamofire.request(.GET, "http://coinmarketcap-nexuist.rhcloud.com/api/clam/price")
                    .responseJSON {
                        let usd = $0.2.value!["usd"]
                        dispatch_async(dispatch_get_main_queue()) {
                            self.data[1].1 = (usd as! NSString).doubleValue
                        }
                }
                
                Alamofire.request(.GET, "http://coinmarketcap-nexuist.rhcloud.com/api/btc/price")
                    .responseJSON {
                        let usd = $0.2.value!["usd"]
                        dispatch_async(dispatch_get_main_queue()) {
                            self.data[0].1 = (usd as! NSString).doubleValue
                        }
                }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        print(sender as! String)
        
        if let des = segue.destinationViewController as? WelcomeViewController {
            des.currency = sender as! String
        }
    }
}

extension CurrencyCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("id", forIndexPath: indexPath) as! CurrencyCollectionViewCell
        cell.nameLabel.text = data[indexPath.row].0
        
//        data[indexPath.row].1 = Double(round(1000 * self.data[indexPath.row].1)/1000)
        
        let lol = data[indexPath.row].1 == 0 ? "" : "\(data[indexPath.row].1)"
        cell.currencyLabel.text = "$\(lol)"
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("unwindToWelcome", sender: data[indexPath.row].0)
    }
}