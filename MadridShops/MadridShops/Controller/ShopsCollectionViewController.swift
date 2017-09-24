//
//  ShopsCollectionViewController
//  MadridShops
//
//  Created by Fabio Gomez on 23/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class ShopsCollectionViewController: UIViewController {

    var shops: Shops?
    let kCellHeight : CGFloat = 50
    let kLineSpacing : CGFloat = 10
    let kInset : CGFloat = 10
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImplementation()
        
        downloadShopsInteractor.execute(onSuccess: { (shops:Shops) in
            print ("Name: " + shops.get(index: 0).name)
            self.shops = shops
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
        })
        
    }


}

