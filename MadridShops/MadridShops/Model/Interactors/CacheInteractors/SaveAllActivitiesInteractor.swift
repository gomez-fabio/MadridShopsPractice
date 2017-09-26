//
//  SaveAllActivitiesInteractor.swift
//  MadridShops
//
//  Created by Fabio Gomez on 26/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import CoreData

protocol SaveAllActivitiesInteractor {
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void, onError: errorClosure)
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void)
}
