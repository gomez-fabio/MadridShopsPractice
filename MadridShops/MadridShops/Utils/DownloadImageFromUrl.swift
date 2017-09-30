//
//  DownloadImageFromUrl.swift
//  MadridShops
//
//  Created by Fabio Gomez on 30/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

func downloadImageFromUrl(url:String) -> Data? {
//        let url = self
//        if let myUrl = URL(string: url), let data = NSData(contentsOf: myUrl){
//            OperationQueue.main.addOperation {
//                return data as Data
//            }
//        } else {
//            print("Problem downloading image")
//        }
//    return nil
    if let myUrl = URL(string: url) {
        if let data = NSData(contentsOf: myUrl) {
            return data as Data
        } else {
            print("Error adquiring data")
        }
    } else {
        print("Error downloading image")
    }
    return nil
}
