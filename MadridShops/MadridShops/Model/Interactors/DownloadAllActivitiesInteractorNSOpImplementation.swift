//
//  DownloadAllActivitiesInteractorNSOpImplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

class DownloadAllActivitiesInteractorNSOpImplementation : DownloadAllActivitiesInteractor {
    
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure = nil) {
        
        let queue = OperationQueue()
        queue.addOperation {
            let urlString = "https://madrid-shops.com/json_new/getActivities.php"
            if let url = URL(string: urlString), let data = NSData(contentsOf: url) as Data?{
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
                    let result = jsonObject["result"] as! [Dictionary<String, Any>]
                    let activities = Activities()
                    
                    for activityJson in result {
                        let activity = Activity(name: activityJson["name"]! as! String)
                        activity.address = activityJson["address"]! as! String
                        activities.add(activity: activity)
                    }
                    
                    OperationQueue.main.addOperation {
                        onSuccess(activities)
                    }
                } catch {
                    
                }
            }
        }
    }
}
