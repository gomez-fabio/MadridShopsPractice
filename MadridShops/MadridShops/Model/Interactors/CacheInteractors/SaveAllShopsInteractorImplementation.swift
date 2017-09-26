//
//  SaveAllShopsInteractorImplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 26/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import CoreData

class SaveAllShopsInteractorImplementation: SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        for i in 0 ..< shops.count() {
            let shop = shops.get(index: i)
            let shopCD = ShopCD(context: context)
            shopCD.name = shop.name
            shopCD.desc = shop.description_en
            shopCD.latitude = shop.latitude!
            shopCD.longitude = shop.longitude!
            shopCD.image  = shop.image
            shopCD.logo = shop.logo
            shopCD.openingHours = shop.openingHours_en
            shopCD.address = shop.address
            shopCD.telephone = shop.telephone
            shopCD.url = shop.url
        }
        do{
            try context.save()
            onSuccess(shops)
        } catch{
        }
    }
}
