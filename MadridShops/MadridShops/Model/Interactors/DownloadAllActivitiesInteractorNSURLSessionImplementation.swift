//
//  DownloadAllActivitiesInteractorNSURLSessionImplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

class DownloadAllActivitiesInteractorNSURLSessionImplementation: DownloadAllActivitiesInteractor {
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        let session = URLSession.shared
        if let url = URL(string: ACTIVITIES_URL) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error == nil {
                        let activities = parseActivities(data: data!)
                        onSuccess(activities)
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

