//
//  RPNcalcUITests.swift
//  RPNcalcUITests
//
//  Created by Rastogi, Aryan (WING) on 12/06/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import XCTest

class RPNcalcUITests: XCTestCase {

    func testEnterButtonIsDisabledAfterPressingEvaluate() {
           
        XCUIApplication().activate()
        
        let app = XCUIApplication()
        app.buttons["EVAL"].tap()
        let enterButton = app.buttons["ENTER"]

        XCTAssertEqual(enterButton.isEnabled, false)
                                                   
       }
       
    func testUserCannotEnterANumberLargerThanThreeDigits() {
        
        XCUIApplication().activate()
           
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["8"].tap()
        app.buttons["3"].tap()

        let oneButton = app.buttons["1"]
        let twoButton = app.buttons["2"]
        let threeButton = app.buttons["3"]
        let fourButton = app.buttons["4"]
        let fiveButton = app.buttons["5"]
        let sixButton = app.buttons["6"]
        let sevenButton = app.buttons["7"]
        let eightButton = app.buttons["8"]
        let nineButton = app.buttons["9"]
        let zeroButton = app.buttons["0"]

        let numberButtonArray = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]

        for button in numberButtonArray {
           XCTAssertEqual(button.isEnabled, false)
        }

    }
    
    
    func testIfDisplayIsBeingUpdated() {
        
        XCUIApplication().activate()
        let app = XCUIApplication()
        
        app.buttons["0"].tap()
        
        XCTAssertEqual(app.staticTexts[""].text, "0")
        
    }
}
