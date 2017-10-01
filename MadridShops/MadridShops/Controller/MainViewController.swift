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
    @IBOutlet weak var buttonShop: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var buttonActivity: UIButton!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    @IBAction func hitReload(_ sender: Any) {self.startMeUp()}
    
    var context: NSManagedObjectContext!

// TODO TO TIDY UP THE CODE
//    enum State {
//        case Download
//        case NoConnection
//        case Success
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.isHidden = true
        self.reloadButton.isEnabled = false
        self.startMeUp()
    }
    
        func startMeUp() {
            ExecuteOnceInteractorImplementation().execute(closure:{
                if isConnectedToNetwork() == true {
                    // TODO POD TO SHOW PROGRESS...
                    self.activityIndicator.isHidden = false
                    self.activityIndicator.startAnimating()
                    self.shopButton.isHidden = true
                    self.activityButton.isHidden = true
                    self.buttonShop.isHidden = true
                    self.buttonActivity.isHidden = true
                    self.reloadButton.isEnabled = false
                    self.initializeShopsData()
                } else {
                    self.activityIndicator.isHidden = true
                    self.shopButton.isHidden = true
                    self.activityButton.isHidden = true
                    self.buttonShop.isHidden = true
                    self.buttonActivity.isHidden = true
                    self.reloadButton.isEnabled = true
                    self.alertMessage()
                }
            } )
        }
        
        func initializeShopsData() {
            
            let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImplementation()
            
            downloadShopsInteractor.execute(onSuccess: { (shops:Shops) in
                let cacheInteractor = SaveAllShopsInteractorImplementation()
                
                cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                    self.initializeActivitiesData()
                })
            })
        }
    
        func alertMessage() {
            let alert = UIAlertController(title: "Looks like a problem to me",
                                          message: "It seems there is no active connection to the internet",
                                          preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry", style: .default, handler: { (action) -> Void in
                self.startMeUp()
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
            
            alert.addAction(retryAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
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
                    self.buttonShop.isHidden = false
                    self.buttonActivity.isHidden = false
                })
            })
        }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue"  || segue.identifier == "ShowShopsImageSegue" {
            let vc = segue.destination as! ShopsCollectionViewController
            
            vc.context = self.context
        }
        
        if segue.identifier == "ShowActivitiesSegue" || segue.identifier == "ShowActivitiesImageSegue" {
            let vc = segue.destination as! ActivitiesCollectionViewController
            
            vc.context = self.context
        }
    }


}
