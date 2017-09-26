//
//  DownloadAllShopsInteractorNSURLSessionImplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSURLSessionImplementation: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        let session = URLSession.shared
        if let url = URL(string: SHOPS_URL) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error == nil {
                        let shops = parseShops(data: data!)
                        onSuccess(shops)
                    } else {
                        if let onError = onError{
                            onError(error!)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}
