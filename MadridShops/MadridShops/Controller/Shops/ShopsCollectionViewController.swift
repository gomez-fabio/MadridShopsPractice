//
//  ShopsCollectionViewController
//  MadridShops
//
//  Created by Fabio Gomez on 23/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class ShopsCollectionViewController: UIViewController, CLLocationManagerDelegate {
    
    var context: NSManagedObjectContext!
    let kCellHeight : CGFloat = 50
    let kLineSpacing : CGFloat = 10
    let kInset : CGFloat = 5
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let madridLocation = CLLocation(latitude: 40.427786, longitude: -3.695894)
        let madridRegion = MKCoordinateRegion(center: madridLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        self.locationManager.requestWhenInUseAuthorization()
        self.mapView.setRegion(madridRegion, animated: true)
        
        self.shopsCollectionView.delegate = self
        self.shopsCollectionView.dataSource = self
        self.mapView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shop: ShopCD = shopFetchedResultsController(context: context).object(at: indexPath)
        
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController
            let shopCD: ShopCD = sender as! ShopCD

            vc.shopCD = shopCD
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewDidLayoutSubviews()
        shopsCollectionView.reloadData()
    }
}

