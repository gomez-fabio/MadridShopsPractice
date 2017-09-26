//
//  ShopsCollectionViewController
//  MadridShops
//
//  Created by Fabio Gomez on 23/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit
import CoreData

class ShopsCollectionViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    var shops: Shops?
    let kCellHeight : CGFloat = 50
    let kLineSpacing : CGFloat = 10
    let kInset : CGFloat = 10
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImplementation()
        
        downloadShopsInteractor.execute(onSuccess: { (shops:Shops) in
            self.shops = shops
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
            
            let cacheInteractor = SaveAllShopsInteractorImplementation()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in

            })
        })
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController
            let indexPath = self.shopsCollectionView.indexPathsForSelectedItems![0]
            let shop = self.shops?.get(index: indexPath.row)
            vc.shop = shop
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewDidLayoutSubviews()
        shopsCollectionView.reloadData()
    }
}

