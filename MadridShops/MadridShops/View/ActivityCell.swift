//
//  ActivityCell.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class ActivityCell: UICollectionViewCell {
    var activityCD: ActivityCD?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func refresh(activityCD: ActivityCD) {
        self.activityCD = activityCD
        self.label.text = activityCD.name
        if let logoImage = activityCD.logoBin {
            self.imageView.image = UIImage(data: logoImage)
        } else{
            self.imageView.image = #imageLiteral(resourceName: "noImage")
        }
    }
}
