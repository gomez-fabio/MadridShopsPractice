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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
        shopButton.isHidden = false
        activityButton.isHidden = false

        // TODO POD TO SHOW PROGRESS...
        ExecuteOnceInteractorImplementation().execute(closure:{
            initializeShopsData()
        } )
    
        
        func initializeShopsData() {
            
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            shopButton.isHidden = true
            activityButton.isHidden = true
            
            let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImplementation()
            
            downloadShopsInteractor.execute(onSuccess: { (shops:Shops) in
                let cacheInteractor = SaveAllShopsInteractorImplementation()
                
                cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                    initializeActivitiesData()
                })
            })
        }
        
        func initializeActivitiesData() {
            let downloadActivitiesInteractor: DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImplementation()
            
            downloadActivitiesInteractor.execute(onSuccess: { (activities:Activities) in
                let cacheInteractor = SaveAllActivitiesInteractorImplementation()
                
                cacheInteractor.execute(activities: activities, context: self.context, onSuccess: { (activities: Activities) in
                    SetExecutedOnceInteractorimplementation().execute()
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                    self.shopButton.isHidden = false
                    self.activityButton.isHidden = false
                })
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue" {
            let vc = segue.destination as! ShopsCollectionViewController
            
            vc.context = self.context
        }
        
        if segue.identifier == "ShowActivitiesSegue" {
            let vc = segue.destination as! ActivitiesCollectionViewController
            
            vc.context = self.context
        }
    }


}
