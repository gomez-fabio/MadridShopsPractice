//
//  JSONParser.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

func parseShops(data: Data) -> Shops {
    
    let shops = Shops()
    do{
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        
        for shopJson in result {
            let shop = Shop(name: shopJson["name"]! as! String)
            shop.address = shopJson["address"]! as! String
            shops.add(shop: shop)
        }
    } catch {
        print("Error parsing JSON")
    }
    return shops
}

func parseActivities(data: Data) -> Activities {
    
    let activities = Activities()
    do{
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        
        for activityJson in result {
            let activity = Activity(name: activityJson["name"]! as! String)
            activity.address = activityJson["address"]! as! String
            activities.add(activity: activity)
        }
    } catch {
        print("Error parsing JSON")
    }
    return activities
}