//
//  ShopsTest.swift
//  MadridShopsTests
//
//  Created by Fabio Gomez on 23/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import XCTest
import MadridShops

class ShopsTest: XCTestCase {
    
    func testGivenEmptyShopsNumberShopisZero() {
        let sut = Shops()
        XCTAssertEqual(0, sut.count())
    }
    
    func testGivenShopsWithOneElementNumberShopisOne() {
        let sut = Shops()
        sut.add(shop: Shop(name: "Test"))
        XCTAssertEqual(0, sut.count())
    }
    
}
