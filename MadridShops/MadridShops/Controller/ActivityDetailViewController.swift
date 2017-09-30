//
//  ActivityDetailViewController.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {

    var activityCD : ActivityCD!
    
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityDescription: UITextView!
    @IBOutlet weak var activityMapImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.activityCD.name
        self.activityDescription.text = self.activityCD.desc
        if let image = activityCD.imageBin{
            self.activityImage.image = UIImage(data: image)
        } else {
            self.activityImage.image = #imageLiteral(resourceName: "noImage")
        }
    }
}
