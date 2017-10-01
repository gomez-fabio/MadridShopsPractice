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
            shop.description_en = shopJson["description_en"] as! String
            shop.description_es = shopJson["description_es"] as! String
            if Locale.current.languageCode == "es" {
                shop.desc = shopJson["description_es"]! as! String
            } else {
                shop.desc = shopJson["description_en"]! as! String
            }
            shop.latitude = Float((shopJson["gps_lat"] as! String).trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ",", with: ""))
            shop.longitude = Float((shopJson["gps_lon"] as! String).trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ",", with: ""))
            shop.image = shopJson["img"] as! String
            shop.logo = shopJson["logo_img"] as! String
            shop.openingHours_en = shopJson["opening_hours_en"] as! String
            shop.openingHours_es = shopJson["opening_hours_es"] as! String
            shop.address = shopJson["address"] as! String
            shop.telephone = shopJson["telephone"] as! String
            shop.url = shopJson["url"] as! String
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
            activity.description_en = activityJson["description_en"] as! String
            activity.description_es = activityJson["description_es"] as! String
            if Locale.current.languageCode == "es" {
                activity.desc = activityJson["description_es"]! as! String
            } else {
                activity.desc = activityJson["description_en"]! as! String
            }
            activity.latitude = Float((activityJson["gps_lat"] as! String).trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ",", with: ""))
            activity.longitude = Float((activityJson["gps_lon"] as! String).trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ",", with: ""))
            activity.image = activityJson["img"] as! String
            activity.logo = activityJson["logo_img"] as! String
            activity.openingHours_en = activityJson["opening_hours_en"] as! String
            activity.openingHours_es = activityJson["opening_hours_es"] as! String
            activity.address = activityJson["address"] as! String
            activity.telephone = activityJson["telephone"] as! String
            activity.url = activityJson["url"] as! String
            activities.add(activity: activity)
        }
    } catch {
        print("Error parsing JSON")
    }
    return activities
}
