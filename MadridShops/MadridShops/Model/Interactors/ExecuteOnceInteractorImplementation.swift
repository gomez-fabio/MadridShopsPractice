//
//  ExecuteOnceInteractorImplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 28/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

class ExecuteOnceInteractorImplementation: ExecuteOnceInteractor {
    func execute(closure: () -> Void) {
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "once") {
        } else {
            closure()
        }
        
    }
}
