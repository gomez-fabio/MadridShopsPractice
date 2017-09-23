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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorFakeImplementation()
        
        downloadShopsInteractor.execute(onSuccess: { (shops:Shops) in
            print ("Name: " + shops.get(index: 0).name)
            self.shops = shops
        })
        
    }


}

