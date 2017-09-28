//
//  SetExecutedOnceInteractorimplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 28/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

class SetExecutedOnceInteractorimplementation: SetExecutedOnceInteractor {
    func execute() {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey: "once")
        defaults.synchronize()
    }
}
