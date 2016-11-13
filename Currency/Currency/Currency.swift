//
//  Currency.swift
//  Currency
//
//  Created by lanjing on 11/13/16.
//  Copyright © 2016 lanjing. All rights reserved.
//

import Foundation

struct Dollar {
    //FIXME: amount need to be private, but fucntion == can NOT pass compile
    var amount : Int
    init(_ amount: Int){
        self.amount = amount
    }
    
    func times(_ multipier: Int) -> Dollar{
        return Dollar(amount * multipier)
    }
    
}

struct Franc {
    //FIXME: amount need to be private, but fucntion == can NOT pass compile
    var amount : Int
    init(_ amount: Int){
        self.amount = amount
    }
    
    func times(_ multipier: Int) -> Dollar{
        return Dollar(amount * multipier)
    }
    
}


func == (left:Dollar, right:Dollar) -> Bool {
    return left.amount == right.amount
}

func == (left:Franc, right:Franc) -> Bool {
    return left.amount == right.amount
}
