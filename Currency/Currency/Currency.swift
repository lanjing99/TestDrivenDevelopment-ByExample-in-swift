//
//  Currency.swift
//  Currency
//
//  Created by lanjing on 11/13/16.
//  Copyright © 2016 lanjing. All rights reserved.
//

import Foundation

protocol Expression {
    func plus(addend:Expression) -> Expression
    func times(_ multipier: Float) -> Expression
    func reduce(toCurrency currency: String, withBank bank: Bank) -> Money
}

class Money : CustomStringConvertible, Expression{
    //FIXME: amount need to be private, but fucntion == can NOT pass compile
    var amount : Float
    var currency :String
    init(_ amount: Float, currency: String){
        self.amount = amount
        self.currency = currency
    }
    
    
    class func dollar(_ amount: Float) -> Money{
        return Money(amount, currency: "USD")
    }
    
    class func franc(_ amount: Float) -> Money{
        return Money(amount, currency: "CHF")
    }
    
    func times(_ multipier: Float) -> Expression{
        return Money(amount * multipier, currency:currency)
    }
    
    var description: String{
        return "\(amount) \(currency)"
    }
    
    func plus(addend: Expression) -> Expression {
        if  let addend = addend as? Money , self.currency == addend.currency {
            return Money(addend.amount + self.amount, currency: currency)
        }else{
            return Sum(augent: self, addend: addend)
        }
    }
    
    
    func reduce(toCurrency currency: String, withBank bank: Bank) -> Money {
        if self.currency == currency {
            return self
        }
        
        let rate = bank.rate(fromCurrency: self.currency, toCurrency: currency)
        let money = Money.init(self.amount / rate, currency: currency)
        return money
    }
}

func +(left:Expression, right:Expression) -> Expression{
    if let left = left as? Money, let right = right as? Money, left.currency == right.currency {
        return Money.init(left.amount + right.amount, currency: left.currency)
    }else{
        return Sum(augent: left, addend: right)
    }
}

func *(money:Money, times:Float) -> Money{
    return Money.init(money.amount * times, currency: money.currency)
}

func *(sum:Sum, times:Float) -> Sum{
    return Sum(augent: sum.augent * times, addend: sum.addend * times)
}

func *(expression: Expression, times: Float) -> Expression {
    assert(expression is Money || expression is Sum)
    if let money = expression as? Money {
        return money * times
    }else{
        let sum = expression as! Sum
        return sum * times
    }
}

func == (left:Money, right:Money) -> Bool {
    //FIXME: amount is float, need an accuracy to compare?
    return (left.currency == right.currency) && (left.amount == right.amount)
}


struct RatePair : Hashable{
    let fromCurrency: String
    let toCurrency: String
    
    var hashValue: Int {
        return 0
    }
}

func == (left:RatePair, right:RatePair) -> Bool {
    return (left.fromCurrency == right.fromCurrency) && (left.toCurrency == right.toCurrency)
}

class Bank {
    
    private var ratesValue = [RatePair:Float]()
    
    func reduce(_ sum : Expression, toCurrency currency: String) -> Money{
       return sum.reduce(toCurrency: currency, withBank: self)
    }
    
    func addRate(fromCurrency from: String, toCurrency to: String, withRate rate: Float){
        ratesValue[RatePair(fromCurrency:from, toCurrency:to)] = rate
    }
    
    func rate(fromCurrency from: String, toCurrency to: String) -> Float{
        var rate = ratesValue[RatePair(fromCurrency:from, toCurrency:to)]
        //eg， if USD->CHF not exist，look for CHF -> USD rate
        if rate == nil {
            rate = ratesValue[RatePair(fromCurrency:to, toCurrency:from)]
            if rate != nil {
                rate = 1 / rate!
            }else{
                //FIXME: need throws exception here if not found an rate
            }
        }
        
        return rate!
    }
}

class Sum : Expression{
    var augent: Expression
    var addend: Expression
    
    init(augent:Expression, addend:Expression){
        self.augent = augent
        self.addend = addend
    }
    
    func reduce(toCurrency currency: String, withBank bank: Bank) -> Money {
        let amount1 = self.augent.reduce(toCurrency: currency, withBank: bank).amount
        let amount2 = self.addend.reduce(toCurrency: currency, withBank: bank).amount
        return Money.init(amount1 + amount2, currency:currency)
    }
    
    func plus(addend:Expression) -> Expression {
        return Sum(augent: self, addend: addend)
    }
    
    func times(_ multipier: Float) -> Expression {
        return Sum(augent: augent.times(multipier), addend: addend.times(multipier))
    }
}


//FIXME: compare according to real type,
func == (left:Expression, right:Expression) -> Bool {
//    return (left.currency == right.currency) && (left.amount == right.amount)
    return true
}

