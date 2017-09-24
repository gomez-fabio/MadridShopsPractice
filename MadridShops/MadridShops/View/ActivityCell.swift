//
//  ActivityCell.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class ActivityCell: UICollectionViewCell {
    var activity: Activity?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func refresh(activity: Activity) {
        self.activity = activity
        self.label.text = activity.name
        self.activity?.logo.loadImage(into: imageView)
    }
}
