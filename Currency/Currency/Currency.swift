//
//  Currency.swift
//  Currency
//
//  Created by lanjing on 11/13/16.
//  Copyright © 2016 lanjing. All rights reserved.
//

import Foundation

class Money {
    var amount : Int
    init(_ amount: Int){
        self.amount = amount
    }
}

class Dollar : Money {
    //FIXME: amount need to be private, but fucntion == can NOT pass compile
//    var amount : Int
//    init(_ amount: Int){
//        self.amount = amount
//    }
    
    func times(_ multipier: Int) -> Dollar{
        return Dollar(amount * multipier)
    }
    
}

class Franc : Money{
    //FIXME: amount need to be private, but fucntion == can NOT pass compile
//    var amount : Int
//    init(_ amount: Int){
//        self.amount = amount
//    }
    
    func times(_ multipier: Int) -> Dollar{
        return Dollar(amount * multipier)
    }
    
}


func == (left:Money, right:Money) -> Bool {
    return type(of: left) ==  type(of: right) &&  left.amount == right.amount
}

func == (left:Dollar, right:Dollar) -> Bool {
    return left.amount == right.amount
}

func == (left:Franc, right:Franc) -> Bool {
    return left.amount == right.amount
}
