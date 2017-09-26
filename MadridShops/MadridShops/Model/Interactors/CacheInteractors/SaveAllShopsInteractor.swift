//
//  SaveAllShopsInteractor.swift
//  MadridShops
//
//  Created by Fabio Gomez on 26/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import CoreData

protocol SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void)
}
