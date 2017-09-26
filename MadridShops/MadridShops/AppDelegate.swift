//
//  AppDelegate.swift
//  MadridShops
//
//  Created by Fabio Gomez on 23/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var cds = CoreDataStack()
    var context: NSManagedObjectContext?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.context = cds.createContainer(dbname: DATABASE_NAME).viewContext
        
        let nav = self.window?.rootViewController as! UINavigationController
        let mainVC = nav.topViewController as! MainViewController
        mainVC.context = self.context
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let context = self.context else { return }
        self.cds.saveContext(context: context)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        guard let context = self.context else { return }
        self.cds.saveContext(context: context)
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        guard let context = self.context else { return }
        self.cds.saveContext(context: context)
    }
}

