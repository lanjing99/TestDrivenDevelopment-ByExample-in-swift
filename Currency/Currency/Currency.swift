//
//  Currency.swift
//  Currency
//
//  Created by lanjing on 11/13/16.
//  Copyright © 2016 lanjing. All rights reserved.
//

import Foundation

struct Dollar {
    var amount : Int
    init(_ amount: Int){
        self.amount = amount
    }
    
    mutating func times(_ multipier: Int) {
        amount = 10
    }
}
