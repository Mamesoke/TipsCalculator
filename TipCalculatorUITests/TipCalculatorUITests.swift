//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Kevin Menendez on 28/2/24.
//

import XCTest

final class TipCalculatorUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        app = runApp()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testGivenContentViewWhenAppInitThenIsShown() throws {
        let expected = "Enter total"

        let totalTextField = app.textFields["totalTextField"]
        
        XCTAssertEqual(totalTextField.value as? String, expected)
    }
    
    func testGiven20PercentWhenDefaultTipOptionThenIsSelected() throws {
        let expected = "20%"
        
        let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegmentedControl"]
        let segmentedControlButton = tipPercentageSegmentedControl.buttons.element(boundBy: 1)
        
        XCTAssertEqual(segmentedControlButton.label, expected)
        XCTAssertTrue(segmentedControlButton.isSelected)
    }
}

private extension TipCalculatorUITests {
    func runApp() -> XCUIApplication {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        return app
    }
}
