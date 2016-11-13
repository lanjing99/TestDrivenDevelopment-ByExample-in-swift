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
}

class Bank {
    
    func reduce(_ sum : Expression, currency: String) -> Expression{
        return sum
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
