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
    
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var shopDescription: UITextView!
    @IBOutlet weak var shopMapImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.shopCD.name
        self.shopDescription.text = self.shopCD.desc
        if let image = shopCD.imageBin {
            self.shopImage.image = UIImage(data: image)
        } else {
            self.shopImage.image = #imageLiteral(resourceName: "noImage")
        }
    }
}
