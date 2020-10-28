//
//  TipCalculatorBrain.swift
//  Tipsy
//
//  Created by Elena Sadler on 10/28/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipCalculatorBrain {
    var billTotalString: String? = "123.56"
    var totalFloat: Float = 0.00
    var tipPercentage: Float = 0.10
    var splitTotalByNumber: Double = 0.0
    var totalPerPerson: Float = 0.00
    
    
    
    
    func calculateTotal(billTotal: Float, tipPercentage: Float, splitTotalByNumber: Double) -> Float {
        let tipAmount = billTotal * tipPercentage
        let totalPlusTip = billTotal + tipAmount
        return totalPlusTip / Float(splitTotalByNumber)
    }
}
