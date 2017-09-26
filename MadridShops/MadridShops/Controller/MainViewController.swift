//
//  MainViewController.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Aqui el pod del ruso
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue" ||
            segue.identifier == "ShowShopsBarSegue"{

            let vc = segue.destination as! ShopsCollectionViewController
            vc.context = self.context
        }
        
        if segue.identifier == "ShowActivitiesSegue" ||
            segue.identifier == "ShowActivitiesBarSegue" {
            
            let vc = segue.destination as! ActivitiesCollectionViewController
            vc.context = self.context
        }
    }


}
