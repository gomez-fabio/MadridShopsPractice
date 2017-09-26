//
//  ActivitiesCollectionViewController.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit
import CoreData

class ActivitiesCollectionViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    var activities: Activities?
    let kCellHeight : CGFloat = 50
    let kLineSpacing : CGFloat = 10
    let kInset : CGFloat = 10
    
    @IBOutlet weak var activitiesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadActivitiesInteractor: DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImplementation()
        
        downloadActivitiesInteractor.execute(onSuccess: { (activities:Activities) in
            self.activities = activities
            self.activitiesCollectionView.delegate = self
            self.activitiesCollectionView.dataSource = self
            
            let cacheInteractor = SaveAllActivitiesInteractorImplementation()
            cacheInteractor.execute(activities: activities, context: self.context, onSuccess: { (activities: Activities) in
                
            })
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showActivityDetailSegue" {
            let vc = segue.destination as! ActivityDetailViewController
            let indexPath = self.activitiesCollectionView.indexPathsForSelectedItems![0]
            let activity = self.activities?.get(index: indexPath.row)
            vc.activity = activity
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewDidLayoutSubviews()
        activitiesCollectionView.reloadData()
    }
}
