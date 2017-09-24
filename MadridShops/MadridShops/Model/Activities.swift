//
//  Activities.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

// Agregado de Activity

import Foundation

public protocol ActivitiesProtocol {
    func count() -> Int
    func add(activity: Activity)
    func get(index: Int) -> Activity
}

public class Activities: ActivitiesProtocol {
    private var activitiesList: [Activity]?
    
    public init() {
        self.activitiesList = []
    }
    
    public func count() -> Int {
        return (activitiesList?.count)!
    }
    
    public func add(activity: Activity) {
        activitiesList?.append(activity)
    }
    
    public func get(index: Int) -> Activity {
        return (activitiesList?[index])!
    }
}
