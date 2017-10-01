//
//  ShopFetchedResultsController.swift
//  MadridShops
//
//  Created by Fabio Gomez on 1/10/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation
import CoreData

var _shopFetchedResultsController: NSFetchedResultsController<ShopCD>? = nil

func shopFetchedResultsController (context: NSManagedObjectContext) -> NSFetchedResultsController<ShopCD> {
    if _shopFetchedResultsController != nil {
        return _shopFetchedResultsController!
    }
    
    let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
    
    fetchRequest.fetchBatchSize = 20
    
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
    
    _shopFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "ShopsCacheFile")
    
    do {
        try _shopFetchedResultsController!.performFetch()
    } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
    
    return _shopFetchedResultsController!
}
