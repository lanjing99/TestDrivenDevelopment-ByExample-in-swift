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
        let five = Money.dollar(5)
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
        let reduced = bank.reduce(sum, toCurrency: "USD")
        XCTAssertTrue(Money.dollar(10) == reduced)
    }
    
    func testReduceSum() {
        let sum = Sum.init(augent: Money.dollar(3), addend: Money.dollar(5))
        let bank = Bank()
        let result = bank.reduce(sum, toCurrency: "USD")
        XCTAssertTrue(Money.dollar(8) == result)
    }
    
    func testReductDifferentCurrency(){
        let bank = Bank()
        bank.addRate(fromCurrency: "CHF", toCurrency:"USD", withRate:3)
        XCTAssertTrue(Money.dollar(1) == bank.reduce(Money.franc(3), toCurrency: "USD"))
        XCTAssertTrue(Money.franc(3) == bank.reduce(Money.dollar(1), toCurrency: "CHF"))
    }
    
    func testBankRate(){
        let bank = Bank()
        bank.addRate(fromCurrency: "USD", toCurrency: "RMB", withRate: 6.0)
        XCTAssertEqualWithAccuracy(bank.rate(fromCurrency: "USD", toCurrency: "RMB"), 6.0, accuracy: 0.0001, "one dollar equals 6 yuan")
        XCTAssertEqualWithAccuracy(bank.rate(fromCurrency: "RMB", toCurrency: "USD"), 1/6.0, accuracy: 0.0001, "one dollar equals 6 yuan")
    }
    
    func testMixedAddition(){
        let fiveDollors = Money.dollar(5)
        let tenFrancs = Money.franc(10);
        let bank = Bank()
        bank.addRate(fromCurrency: "CHF", toCurrency: "USD", withRate: 2)
        let dollarSum = bank.reduce(fiveDollors.plus(addend: tenFrancs), toCurrency: "USD")
        XCTAssertTrue(dollarSum == Money.dollar(10))
        let francSum = bank.reduce(fiveDollors.plus(addend: tenFrancs), toCurrency: "CHF")
        XCTAssertTrue(francSum == Money.franc(20))
        
    }
}











