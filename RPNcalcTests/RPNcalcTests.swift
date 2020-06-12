//
//  RPNcalcTests.swift
//  RPNcalcTests
//
//  Created by Rastogi, Aryan (WING) on 10/06/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import XCTest
@testable import RPNcalc

class RPNcalcTests: XCTestCase {

    func testIfCalculatorIsProducingCorrectResults(){
        //arrange
        let calculator = Calculator(result: nil)
        let testCases = [(input: ["8", "78", "+"], expected: "86"),
                         (input: ["-8", "8", "-"], expected: "-16"),
                         (input: ["3", "5","*", "4", "4", "*", "-"], expected: "-1"),
                         (input: ["-8", "-8", "/"], expected: "1"),
                         (input: ["10", "6", "-"], expected: "4"),
                         (input: ["3", "10", "5", "+", "*"], expected: "45"),
                         (input: ["4", "13", "5", "/", "+"], expected: "6"),
                         (input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"], expected: "22")]
        
        for testCase in testCases {
            calculator.calculation(expression: testCase.input)
            let actual = calculator.result
            XCTAssertEqual(actual, testCase.expected)
        }
        
    }
    
    
    func testIfErrorsAreBeingPickedUp() {
        let calculator = Calculator(result: nil)
        let testCases = [["3", "10", "b", "+", "*"],
                         ["1", "10", "8", "7", "-1"],
                         [""],
                         ["8", "2"],
                         ["+", "+", "+", "+", "+"],
                         ["3", "+", "5", "+", "*"],
                         ["3", "10", "5", "+", "*", "-2"],
                         ["rNDOM", "10", "5", "+", "*"],
                         ["3", "10", "5", "+", "*", "9"],
                         ["3", "0", "/"]]
        
        for testCase in testCases {
            calculator.calculation(expression: testCase)
            let actual = calculator.result
            XCTAssertEqual(actual, "Error")
        }
    }
    
    func testIfDisplayIsBeingCompletelyCleared() {
        
        let display = Display(characters: "8567*", expression: ["85", "67", "*"], currentElement: "9")
        display.clear()
        XCTAssertEqual(display.characters, " ")
        XCTAssertEqual(display.expression, [])
        XCTAssertEqual(display.currentElement, "")
    }
    
    
    func testIfExpressionsAreBeingBuiltProperly() {
        
        let display = Display(characters: "", expression: [], currentElement: "")
        display.addToCurrent(value: "23")
        display.addExpression()
        display.clearCurrentElement()
        display.addToCurrent(value: "20")
        display.addExpression()
        display.clearCurrentElement()
        display.addToCurrent(value: "*")
        display.addExpression()
        display.clearCurrentElement()
        
        XCTAssertEqual(display.expression, ["23", "20", "*"])
    }
    
    


}
