//
//  Calculator.swift
//  RPNcalc
//
//  Created by Rastogi, Aryan (WING) on 10/06/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

class Calculator {
    
    var result: String?
    
    init(result: String?) {
        self.result = result
    }
    
    
    
    
    func calculation(expression: [String]) {
      var stack = [String]()
      if validExpression(expression: expression) == false {
        self.result = "Error"
        return
      }
      for item in expression {
        if isInt(value: item) == true {
            stack.append(item)
        } else {
          let stackTwo = stack.popLast() ?? "Error"
          let stackOne = stack.popLast() ?? "Error"
          if isInt(value: stackOne) == false || isInt(value: stackTwo) == false {
            self.result = "Error"
            return
          } else {
            let operandTwo = Int(stackTwo)!
            let operandOne = Int(stackOne)!
            let result = arithmetic(symbol: item, operandOne: operandOne, operandTwo: operandTwo)
            stack.append(result)
          }
        }
      }
      self.result = stack.popLast() ?? "Error"
      return
    }
    
    
    
    
    
    private func isInt(value: String) -> Bool {
      if Int(value) != nil {
        return true
      } else {
        return false
      }
    }
    
    
    

    private func arithmetic(symbol: String, operandOne: Int, operandTwo: Int) -> String {
      if symbol == "+" {
        return String(operandOne + operandTwo)
      } else if symbol == "-" {
        return String(operandOne - operandTwo)
      } else if symbol == "/" {
            if operandTwo == 0 {
                return "Error"
            } else {
                return String(operandOne / operandTwo)
            }
      } else if symbol == "*" {
        return String(operandOne * operandTwo)
      } else {
        return "Error"
      }
    }
    
    
    
    

    private func validExpression(expression: [String]) -> Bool {
      var valid = true

      if expression.count < 3 {
        valid = false
      } else if isInt(value: expression[0]) == false || isInt(value: expression[1]) == false {
        valid = false
      } else if isInt(value: expression[expression.count - 1]) == true {
        valid = false
      }
      var finished = false
      while valid == true && finished == false {
        for i in 0...expression.count - 1 {
          if isInt(value: expression[i]) == false {
            if expression[i] != "+" && expression[i] != "-" && expression[i] != "/" && expression[i] != "*" {
              valid = false
            }
          }
        }
        finished = true
      }
      return valid
    }
    
    
}
