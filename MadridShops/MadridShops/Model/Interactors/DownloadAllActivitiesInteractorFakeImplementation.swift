//
//  DownloadAllActivitiesInteractorFakeImplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

class DownloadAllActivitiesInteractorFakeImplementation : DownloadAllActivitiesInteractor {
    
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure = nil) {
        let activities = Activities()
        
        for i in 0...10 {
            let activity = Activity(name: "Activity number \( i )")
            activity.address = "Address \( i )"
            
            activities.add(activity: activity)
        }
        
        OperationQueue.main.addOperation {
            onSuccess(activities)
        }
    }
}
