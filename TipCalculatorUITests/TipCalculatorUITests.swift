//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Kevin Menendez on 28/2/24.
//

import XCTest

final class TipCalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenContentViewWhenAppInitThenIsShown() throws {
        let expected = "Enter total"
        
        let app = runApp()

        let totalTextField = app.textFields["totalTextField"]
        
        XCTAssertEqual(totalTextField.value as? String, expected)
    }
    
    func testGiven20PercentWhenDefaultTipOptionThenIsSelected() throws {
        let expected = "20%"
        
        let app = runApp()
        
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
