//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {

    var shop: Shop?
    
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var shopDescription: UITextView!
    @IBOutlet weak var shopMapImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.shop?.name
        self.shopDescription.text = self.shop?.description_en
        self.shop?.image.loadImage(into: shopImage)
    }
}
