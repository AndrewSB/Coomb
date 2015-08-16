//
//  CurrencyCollectionViewController.swift
//  Arbytrage
//
//  Created by Andrew Breckenridge on 8/16/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class CurrencyCollectionViewController: UIViewController {
    
    let data = [
        ("BTC", 43.1),
        ("CLAM", 11.04),
        ("PRO", 15.96),
        ("BANX", 1.23)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension CurrencyCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("id", forIndexPath: indexPath) as! CurrencyCollectionViewCell
        cell.nameLabel.text = data[indexPath.row].0
        cell.currencyLabel.text = "$\(data[indexPath.row].1)"
        
        return cell
    }
}