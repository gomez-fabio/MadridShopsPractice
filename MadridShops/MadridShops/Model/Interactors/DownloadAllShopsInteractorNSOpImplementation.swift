//
//  DownloadAllShopsInteractorNSOpImplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSOpImplementation : DownloadAllShopsInteractor {
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {

        let queue = OperationQueue()
        queue.addOperation {
            let urlString = "https://madrid-shops.com/json_new/getShops.php"
            if let url = URL(string: urlString), let data = NSData(contentsOf: url) as Data?{
                    let shops = parseShops(data: data)
                    OperationQueue.main.addOperation {
                        onSuccess(shops)
                    }
            }
        }
    }
}
