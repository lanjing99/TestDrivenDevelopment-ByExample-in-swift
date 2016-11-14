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
    }
    
    func testSimpleAddition(){
        let sum = Money.dollar(5).plus(addend: Money.dollar(5))
        XCTAssertTrue(Money.dollar(10) == sum)
        
        let bank = Bank()
        let reduced = bank.reduce(sum, currency: "USD")
        XCTAssertTrue(Money.dollar(10) == reduced)
    }
    
    func testReduceSum() {
        let sum = Sum.init(augent: Money.dollar(3), addend: Money.dollar(5))
        let bank = Bank()
        let result = bank.reduce(sum, currency: "USD")
        XCTAssertTrue(Money.dollar(8) == result)
    }
}











