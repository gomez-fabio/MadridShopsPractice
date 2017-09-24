//
//  DownloadAllActivitiesInteractor.swift
//  MadridShops
//
//  Created by Fabio Gomez on 24/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

protocol DownloadAllActivitiesInteractor {
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping (Activities) -> Void)
}
