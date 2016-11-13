//
//  CurrencyTests.swift
//  CurrencyTests
//
//  Created by lanjing on 11/13/16.
//  Copyright © 2016 lanjing. All rights reserved.
//

import XCTest
@testable import Currency

class CurrencyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testMultiplication() {
        let five = Dollar(5)
        XCTAssert(five.times(2) == Dollar(10))
        XCTAssert(five.times(3) == Dollar(15))
        
    }
    
    func testFrancMultiplication() {
        let five = Franc(5)
        XCTAssert(five.times(2) == Dollar(10))
        XCTAssert(five.times(3) == Dollar(15))
    }
    
    func testEquality() {
        XCTAssertTrue(Dollar(5) == Dollar(5))
        XCTAssertFalse(Dollar(5) == Dollar(6))
        XCTAssertFalse(Dollar(5) == Franc(5))
    }
}











