//
//  Display.swift
//  RPNcalc
//
//  Created by Rastogi, Aryan (WING) on 11/06/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

class Display {
    
    var characters: String
    var expression: [String]
    var currentElement: String
    
    init(characters: String, expression: [String], currentElement: String) {
        self.expression = expression
        self.characters = characters
        self.currentElement = currentElement
    }
    
    func clear() {
        self.characters = " "
        self.expression = []
        self.currentElement = ""
    }
    
    func addChar(character: String) {
        self.characters.append(character)
    }
    
    func addExpression() {
        self.expression.append(self.currentElement)
    }
    
    func addToCurrent(value: String) {
        self.currentElement += value
    }
}
