//
//  ShopCell.swift
//  MadridShops
//
//  Created by Fabio Gomez on 23/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    var shopCD: ShopCD?
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    func refresh(shopCD: ShopCD) {
        self.shopCD = shopCD
        
        
        if let image = shopCD.imageBin {
            self.backImage.image = UIImage(data: image)
        } else {
            self.backImage.image = #imageLiteral(resourceName: "noImage")
        }
        
        
//        if let image = UIImage(data: (self.shopCD?.logoBin)!) {
//            self.imageView.image = image
//        } else {
//            self.imageView.image = #imageLiteral(resourceName: "noImage")
//        }
        if let logoImage = shopCD.logoBin {
            self.imageView.image = UIImage(data: logoImage)
        } else{
            self.imageView.image = #imageLiteral(resourceName: "noImage")
        }
        self.label.text = shopCD.name
    
    }
}
