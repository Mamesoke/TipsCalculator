//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by Kevin Menendez on 28/2/24.
//

import Foundation
import XCTest

class ContentViewPage {
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var totalTextField: XCUIElement {
        app.textFields["totalTextField"]
    }
    
    var tipPercentageSegmentedControl: XCUIElement {
        app.segmentedControls["tipPercentageSegmentedControl"]
    }
    
    var calculateTipButton: XCUIElement {
        app.buttons["calculateTipButton"]
    }

    var tipText: XCUIElement {
        app.staticTexts["tipText"]
    }

    var messageText: XCUIElement {
        app.staticTexts["messageText"]
    }
}
