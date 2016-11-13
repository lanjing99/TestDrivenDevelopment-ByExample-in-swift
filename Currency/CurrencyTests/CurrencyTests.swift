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
        let five = Money.dollar(5)
        XCTAssert(five.times(2) == Money.dollar(10))
        XCTAssert(five.times(3) == Money.dollar(15))
        
    }
    
    func testFrancMultiplication() {
        let five = Money.franc(5)
        XCTAssert(five.times(2) == Money.dollar(10))
        XCTAssert(five.times(3) == Money.dollar(15))
    }
    
<<<<<<< HEAD
//    func testEquality() {
//        XCTAssertTrue(Dollar(5) == Money.dollar(5))
//        XCTAssertFalse(Dollar(5) == Money.dollar(6))
//        XCTAssertFalse(Dollar(5) == Franc(5))
//    }
    
    func testCurrency() {
        XCTAssertTrue("USD" == Money.dollar(1).currency)
        XCTAssertTrue("CHF" == Money.franc(1).currency)
    }
    
    func testDifferentCurrency(){
        XCTAssertFalse(Money.init(10, currency: "USD") == Money.init(10, currency: "CHF"))
=======
    func testEquality() {
        XCTAssertTrue(Dollar(5) == Dollar(5))
        XCTAssertFalse(Dollar(5) == Dollar(6))
        XCTAssertFalse(Dollar(5) == Franc(5))
>>>>>>> ba83b436d9d489013217bf62444b36b213ff210b
    }
}











