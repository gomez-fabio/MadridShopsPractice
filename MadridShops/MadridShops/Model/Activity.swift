//
//  Activity.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

public class Activity {
    var name: String
    var description_en: String = ""
    var description_es: String = ""
    var latitude:  Float? = nil
    var longitude: Float? = nil
    var image : String = ""
    var logo: String = ""
    var openingHours_en: String = ""
    var openingHours_es: String = ""
    var address: String = ""
    var telephone: String = ""
    var url: String = ""
    var desc: String = ""
    
    public init(name: String) {
        self.name = name
    }
}
