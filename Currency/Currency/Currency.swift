//
//  Currency.swift
//  Currency
//
//  Created by lanjing on 11/13/16.
//  Copyright © 2016 lanjing. All rights reserved.
//

import Foundation

protocol Expression {
    func plus(addend:Money) -> Expression
    func reduce(toCurrency currency: String) -> Money
}

class Money : CustomStringConvertible, Expression{
    //FIXME: amount need to be private, but fucntion == can NOT pass compile
    var amount : Int
    var currency :String
    init(_ amount: Int, currency: String){
        self.amount = amount
        self.currency = currency
    }
    
    
    class func dollar(_ amount: Int) -> Money{
        return Money(amount, currency: "USD")
    }
    
    class func franc(_ amount: Int) -> Money{
        return Money(amount, currency: "CHF")
    }
    
    func times(_ multipier: Int) -> Money{
        return Money(amount * multipier, currency:currency)
    }
    
    var description: String{
        return "\(amount) \(currency)"
    }
    
    func plus(addend: Money) -> Expression {
        return Money.init(amount + addend.amount, currency: currency)
    }
    
    func reduce(toCurrency currency: String) -> Money {
        return self
    }
}

class Bank {
    
    func reduce(_ sum : Expression, currency: String) -> Money{
       return sum.reduce(toCurrency: currency)
    }
}

class Sum : Expression{
    var augent: Money
    var addend: Money
    
    init(augent:Money, addend:Money){
        self.augent = augent
        self.addend = addend
    }
    
    func reduce(toCurrency currency: String) -> Money {
        //FIXME: only  handle same currency
        return Money.init(augent.amount + addend.amount, currency: augent.currency)
    }
    
    func plus(addend:Money) -> Expression {
        return self
    }
}


func == (left:Money, right:Money) -> Bool {
    return (left.currency == right.currency) && (left.amount == right.amount)
}

//FIXME: compare according to real type,
func == (left:Expression, right:Expression) -> Bool {
//    return (left.currency == right.currency) && (left.amount == right.amount)
    return true
}

//func == (left:Dollar, right:Dollar) -> Bool {
//    return left.amount == right.amount
//}
//
//func == (left:Franc, right:Franc) -> Bool {
//    return left.amount == right.amount
//}
