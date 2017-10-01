//
//  ActivitiesCollectionViewController.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class ActivitiesCollectionViewController: UIViewController, CLLocationManagerDelegate{
    
    var context: NSManagedObjectContext!
    let kCellHeight : CGFloat = 50
    let kLineSpacing : CGFloat = 10
    let kInset : CGFloat = 10
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var activitiesCollectionView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let madridLocation = CLLocation(latitude: 40.427786, longitude: -3.695894)
        let madridRegion = MKCoordinateRegion(center: madridLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        self.locationManager.requestWhenInUseAuthorization()
        self.mapView.setRegion(madridRegion, animated: true)
    
        self.activitiesCollectionView.delegate = self
        self.activitiesCollectionView.dataSource = self
        self.mapView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activity: ActivityCD = activityFetchedResultsController(context: context).object(at: indexPath)
        
        self.performSegue(withIdentifier: "ShowActivityDetailSegue", sender: activity)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowActivityDetailSegue" {
            let vc = segue.destination as! ActivityDetailViewController
            let activityCD: ActivityCD = sender as! ActivityCD
            
            vc.activityCD = activityCD
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewDidLayoutSubviews()
        activitiesCollectionView.reloadData()
    }
}
