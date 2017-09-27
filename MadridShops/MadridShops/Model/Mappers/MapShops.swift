//
//  MapShops.swift
//  MadridShops
//
//  Created by Fabio Gomez on 27/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation
import CoreData

func mapShopCDIntoShop(shopCD: ShopCD) -> Shop{
    
    let shop = Shop(name: shopCD.name!)
    shop.description_en = shopCD.description
    shop.latitude = shopCD.latitude
    shop.longitude = shopCD.longitude
    shop.image  = shopCD.image ?? ""
    shop.logo = shopCD.logo  ?? ""
    shop.openingHours_en = shopCD.openingHours  ?? ""
    shop.address = shopCD.address ?? ""
    shop.telephone = shopCD.telephone ?? ""
    shop.url = shopCD.url ?? ""
    
    return shop
}

func mapShopIntoShopCD(context: NSManagedObjectContext, shop: Shop) -> ShopCD{
    
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
    
    return shopCD
}
