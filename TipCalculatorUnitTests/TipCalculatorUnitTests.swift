//
//  TipCalculatorUnitTests.swift
//  TipCalculatorUnitTests
//
//  Created by Kevin Menendez on 27/2/24.
//

import XCTest
@testable import TipCalculator

final class TipCalculatorUnitTests: XCTestCase {
    var tipCalculator: TipCalculator!
    
    override func setUp() {
        tipCalculator = TipCalculator()
    }
    
    override func tearDown() {
        tipCalculator = nil
    }

    func testGivenOnePercentWhenCalculateThenMatchExpected() throws {
        let expected = 10.0
        let result = try? tipCalculator.calculate(total: 100, tipPercentage: 0.1)
        XCTAssertEqual(result, expected)
    }
    
    func testGivenInvalidTotalWhenCalculateThenInvalidInput() throws {
        XCTAssertThrowsError(try tipCalculator.calculate(total: -100, tipPercentage: 0.1), "") { error in
            XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidInput)
        }
    }
}
