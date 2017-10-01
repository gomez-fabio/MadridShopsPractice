//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {

//    var shop: Shop?
    var shopCD: ShopCD!
    
    @IBOutlet weak var shopDescription: UITextView!
    @IBOutlet weak var shopMapImage: UIImageView!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopAddress: UILabel!
    @IBOutlet weak var shopHours: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.shopCD.name
        self.shopDescription.text = self.shopCD.desc
        
        if let map = shopCD.mapBin{
            self.shopMapImage.image = UIImage(data: map)
        } else {
            self.shopMapImage.image = #imageLiteral(resourceName: "noImage")
        }
        
        self.shopName.text = self.shopCD.name
        self.shopAddress.text = self.shopCD.address
        self.shopHours.text = self.shopCD.openingHours
    }
}
