//
//  Currency.swift
//  Currency
//
//  Created by lanjing on 11/13/16.
//  Copyright © 2016 lanjing. All rights reserved.
//

import Foundation

class Money : CustomStringConvertible {
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
}




func == (left:Money, right:Money) -> Bool {
    return (left.currency == right.currency) && (left.amount == right.amount)
}

//func == (left:Dollar, right:Dollar) -> Bool {
//    return left.amount == right.amount
//}
//
//func == (left:Franc, right:Franc) -> Bool {
//    return left.amount == right.amount
//}
