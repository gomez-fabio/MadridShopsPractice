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
    
    @IBOutlet weak var activityDescription: UITextView!
    @IBOutlet weak var activityMapImage: UIImageView!
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var activityAdress: UILabel!
    @IBOutlet weak var activityHours: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.activityCD.name
        self.activityDescription.text = self.activityCD.desc
        self.activityName.text = self.activityCD.name
        self.activityAdress.text = self.activityCD.address
        self.activityHours.text = self.activityCD.openingHours
        
        if let map = activityCD.mapBin{
            self.activityMapImage.image = UIImage(data: map)
        } else {
            self.activityMapImage.image = #imageLiteral(resourceName: "noImage")
        }
    }
}
