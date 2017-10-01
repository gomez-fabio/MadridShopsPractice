//
//  ActivityFetchedResultsController.swift
//  MadridShops
//
//  Created by Fabio Gomez on 1/10/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation
import CoreData

var _activityFetchedResultsController: NSFetchedResultsController<ActivityCD>? = nil

func activityFetchedResultsController (context: NSManagedObjectContext) -> NSFetchedResultsController<ActivityCD> {
    if _activityFetchedResultsController != nil {
        return _activityFetchedResultsController!
    }
    
    let fetchRequest: NSFetchRequest<ActivityCD> = ActivityCD.fetchRequest()
    
    fetchRequest.fetchBatchSize = 20
    
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
    
    _activityFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "ActivitiesCacheFile")
    
    do {
        try _activityFetchedResultsController!.performFetch()
    } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
    
    return _activityFetchedResultsController!
}
