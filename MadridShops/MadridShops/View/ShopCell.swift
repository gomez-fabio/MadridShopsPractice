//
//  ShopCell.swift
//  MadridShops
//
//  Created by Fabio Gomez on 23/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    var shop: Shop?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func refresh(shop: Shop) {
        self.shop = shop
        self.label.text = shop.name
        //TODO IMAGE VIEW
    }
}
