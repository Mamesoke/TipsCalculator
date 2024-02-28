//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Kevin Menendez on 28/2/24.
//

import XCTest

final class TipCalculatorUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!

    override func setUpWithError() throws {
        app = runApp()
        contentViewPage = .init(app: app)
    }

    override func tearDownWithError() throws {
        contentViewPage = nil
        app = nil
    }

    func testGivenContentViewWhenAppInitThenIsShown() throws {
        let expected = "Enter total"

        let totalTextField = contentViewPage.totalTextField
        
        XCTAssertEqual(totalTextField.value as? String, expected)
    }
    
    func testGiven20PercentWhenDefaultTipOptionThenIsSelected() throws {
        let expected = "20%"
        
        let tipPercentageSegmentedControl = contentViewPage.tipPercentageSegmentedControl
        let segmentedControlButton = tipPercentageSegmentedControl.buttons.element(boundBy: 1)
        
        XCTAssertEqual(segmentedControlButton.label, expected)
        XCTAssertTrue(segmentedControlButton.isSelected)
    }
    
    func testGivenNumberWhenCalculateThenIsPressed() {
        let expected = formatCurrency(20.00)

        let totalTextField = contentViewPage.totalTextField
        totalTextField.tap()
        totalTextField.typeText("100")

        let calculateTipButton = contentViewPage.calculateTipButton
        calculateTipButton.tap()
        
        let tipText = contentViewPage.tipText
        
        let _ = tipText.waitForExistence(timeout: 0.5)
        
        XCTAssertEqual(tipText.label, expected)
    }
    
    func testGivenInvalidNumberWhenCalculateThenMessageIsShown() {
        let expected = "Invalid input"

        let totalTextField = contentViewPage.totalTextField
        totalTextField.tap()
        totalTextField.typeText("-100")
        
        let calculateTipButton = contentViewPage.calculateTipButton
        calculateTipButton.tap()
        
        let messageText = contentViewPage.messageText
        
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
