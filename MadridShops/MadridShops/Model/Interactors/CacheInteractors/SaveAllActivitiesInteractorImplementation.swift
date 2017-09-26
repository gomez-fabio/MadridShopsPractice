//
//  SaveAllActivitiesInteractorImplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 26/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import CoreData

class SaveAllActivitiesInteractorImplementation: SaveAllActivitiesInteractor {
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void) {
        execute(activities: activities, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        for i in 0 ..< activities.count() {
            let activity = activities.get(index: i)
            let activityCD = ActivityCD(context: context)
            activityCD.name = activity.name
            activityCD.desc = activity.description_en
            activityCD.latitude = activity.latitude!
            activityCD.longitude = activity.longitude!
            activityCD.image  = activity.image
            activityCD.logo = activity.logo
            activityCD.openingHours = activity.openingHours_en
            activityCD.address = activity.address
            activityCD.telephone = activity.telephone
            activityCD.url = activity.url
        }
        do{
            try context.save()
            onSuccess(activities)
        } catch{
        }
    }
}
