//
//  CoreDataStack.swift
//  CoreDataHelloWorld
//
//  Created by Fabio Gomez on 17/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import CoreData

public class CoreDataStack {
    
    public func createContainer(dbname: String) -> NSPersistentContainer{
        let container = NSPersistentContainer(name: dbname)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            print("💾 \(storeDescription.description)")
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }
    
    public func saveContext (context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

