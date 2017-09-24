//
//  ActivitiesCollectionViewController.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class ActivitiesCollectionViewController: UIViewController {
    
    var activities: Activities?
    let kCellHeight : CGFloat = 50
    let kLineSpacing : CGFloat = 10
    let kInset : CGFloat = 10
    
    @IBOutlet weak var activitiesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadActivitiesInteractor: DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImplementation()
        
        downloadActivitiesInteractor.execute(onSuccess: { (activities:Activities) in
            print ("Name: " + activities.get(index: 0).name)
            self.activities = activities
            self.activitiesCollectionView.delegate = self
            self.activitiesCollectionView.dataSource = self
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
    
}
