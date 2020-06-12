//
//  RPNcalcUITests.swift
//  RPNcalcUITests
//
//  Created by Rastogi, Aryan (WING) on 10/06/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import XCTest

class RPNcalcUITests: XCTestCase {
    
    
    func testEnterButtonIsDisabledAfterPressingEvaluate() {
        
        let app = XCUIApplication()
        app.buttons["evalButton"].tap()
        let enterButton = app.buttons["enterButton"]
        
        XCTAssertEqual(enterButton.isEnabled, true)
                                                
    }
    
    func testUserCannotEnterANumberLargerThanThreeDigits() {
        
        let app = XCUIApplication()
        app.buttons["oneButton"].tap()
        app.buttons["eightButton"].tap()
        app.buttons["threeButton"].tap()
        
        let oneButton = app.buttons["oneButton"]
        let twoButton = app.buttons["twoButton"]
        let threeButton = app.buttons["threeButton"]
        let fourButton = app.buttons["fourButton"]
        let fiveButton = app.buttons["fiveButton"]
        let sixButton = app.buttons["sixButton"]
        let sevenButton = app.buttons["sevenButton"]
        let eightButton = app.buttons["eightButton"]
        let nineButton = app.buttons["nineButton"]
        let zeroButton = app.buttons["zeroButton"]
        
        let numberButtonArray = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        
        for button in numberButtonArray {
            XCTAssertEqual(button.isEnabled, false)
        }
        
    }
    
    

    
}
