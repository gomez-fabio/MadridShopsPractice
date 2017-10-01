//
//  MapActivities.swift
//  MadridShops
//
//  Created by Fabio Gomez on 27/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation
import CoreData

func mapActivityCDIntoActivity(activityCD: ActivityCD) -> Activity{
    
    let activity = Activity(name: activityCD.name!)
    activity.desc = activityCD.desc!
    activity.latitude = activityCD.latitude
    activity.longitude = activityCD.longitude
    activity.image  = activityCD.image ?? ""
    activity.logo = activityCD.logo  ?? ""
    activity.openingHours_en = activityCD.openingHours  ?? ""
    activity.address = activityCD.address ?? ""
    activity.telephone = activityCD.telephone ?? ""
    activity.url = activityCD.url ?? ""
    
    return activity
}

func mapActivityIntoActivityCD(context: NSManagedObjectContext, activity: Activity) -> ActivityCD{
    
    let activityCD = ActivityCD(context: context)
    activityCD.name = activity.name
    activityCD.desc = activity.desc
    activityCD.latitude = activity.latitude!
    activityCD.longitude = activity.longitude!
    activityCD.image  = activity.image
    activityCD.logo = activity.logo
    activityCD.openingHours = activity.openingHours_en
    activityCD.address = activity.address
    activityCD.telephone = activity.telephone
    activityCD.url = activity.url
    activityCD.imageBin = downloadImageFromUrl(url: activity.image)
    activityCD.logoBin  = downloadImageFromUrl(url: activity.logo)
    activityCD.mapBin = downloadImageFromUrl(url: GOOGLE_MAPS_API + "\(activity.latitude!),\(activity.longitude!)")
//    print (GOOGLE_MAPS_API + "\(activity.latitude!),\(activity.longitude!)")
    return activityCD
}
