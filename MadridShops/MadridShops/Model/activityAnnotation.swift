//
//  activityAnnotation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 30/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation
import MapKit

class ActivityMapPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title : String?
    var subtitle : String?
    var activityCD : ActivityCD
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, activityCD: ActivityCD) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.activityCD = activityCD
    }
    
    func getActivityCD() -> ActivityCD {
        return activityCD
    }
}
