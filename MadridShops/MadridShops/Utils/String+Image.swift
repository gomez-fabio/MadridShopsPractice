//
//  String+Image.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

extension String {
    func loadImage (into imageview: UIImageView) {
        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: self), let data = NSData(contentsOf: url), let image = UIImage(data: data as Data) {
                OperationQueue.main.addOperation {
                    imageview.image = image
                }
            }
        }
    }
}
