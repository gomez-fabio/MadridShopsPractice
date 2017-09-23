//
//  DownloadAllShopsInteractorFakeImplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 23/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorFakeImplementation: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        let shops = Shops()
        
        for i in 0...10 {
            let shop = Shop(name: "Shop number \(i)")
            shop.address = "Address \(i)"
            
            shops.add(shop: shop)
        }
        
        OperationQueue.main.addOperation {
            onSuccess(shops)
        }
    }
    
    
}
