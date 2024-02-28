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
    
    func testGivenNumberWhenCalculateThenIsPressed() {
        let expected = formatCurrency(20.00)

        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("100")

        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
        
        let tipText = app.staticTexts["tipText"]
        
        let _ = tipText.waitForExistence(timeout: 0.5)
        
        XCTAssertEqual(tipText.label, expected)
    }
    
    func testGivenInvalidNumberWhenCalculateThenMessageIsShown() {
        let expected = "Invalid input"

        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("-100")
        
        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        
        let _ = messageText.waitForExistence(timeout: 0.5)
        
        XCTAssertEqual(messageText.label, expected)
    }
}

private extension TipCalculatorUITests {
    func runApp() -> XCUIApplication {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        return app
    }
    
    func formatCurrency(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number)) ?? "-"
    }
}
