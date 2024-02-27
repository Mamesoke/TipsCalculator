//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Kevin Menendez on 27/2/24.
//

enum TipCalculatorError: Error {
    case invalidInput
}

class TipCalculator {
    func calculate(total: Double, tipPercentage: Double) throws -> Double {
        guard total > 0.0 else { throw TipCalculatorError.invalidInput }

        return total * tipPercentage
    }
}
