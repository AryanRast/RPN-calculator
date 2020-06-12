//
//  ViewController.swift
//  RPNcalc
//
//  Created by Rastogi, Aryan (WING) on 10/06/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var subtractButton: UIButton! // Refrences to buttons so that they can be manipulated programmitically
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var evalButton: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var signButton: UIButton!
    
    
    var calculator = Calculator(result: nil)
    var display = Display(characters: " ", expression: [], currentElement: "")  // instantiation of a calculator and a display
    

    var numberCounter = 0           // numberCounter keeps track of all the number of times an integer button has been tapped

    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()                    // upon opening uiSetup is called to style all the buttons and labels
        
    }
    
    
   
    func updateDisplay() {                 // Updates the display and invalidates integer buttons if three have been pressed consecutively
        displayLabel.text = self.display.characters + self.display.currentElement
        if numberCounter >= 3 {
            let buttons = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, addButton, multiplyButton, subtractButton, divideButton, evalButton]
            disableButtons(buttons: buttons)
        }
    }
    
    
    
    func enableAllButtons() {          // Enables all buttons
        let buttons = [signButton, zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, addButton, multiplyButton, subtractButton, divideButton, enterButton, evalButton]
        for button in buttons {
            button?.isEnabled = true
            button?.alpha = 1.0
        }

    }
    
    func disableButtons(buttons: [UIButton?]) {   // Disables specific buttons
        for button in buttons {
            button?.isEnabled = false
            button?.alpha = 0.7
        }
    }
    
    func forceClearTap() {               // Sends all buttons apart from clear to be disabled, forcing the user to tap clear
        let buttons = [signButton, zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, addButton, multiplyButton, subtractButton, divideButton, enterButton, evalButton]
        disableButtons(buttons: buttons)
    }
    
    
    @IBAction func clearButtonTap(_ sender: Any) {
        enableAllButtons()
        self.numberCounter = 0           // resets the number counter

        self.display.clear()                   // Calls clear method on display, therfore clearing the display
        updateDisplay()
    }
    
    
    
    
    // The following functions simply add the character, corresponding to the button that was pressed, to the current element (current element = the operater/operand that is being inputted). After this updateDisplay is invoked to update the display
    
    
    
    @IBAction func oneButtonTap(_ sender: Any) {
        self.numberCounter += 1
        self.display.addToCurrent(value: "1")
        updateDisplay()
        
    }
    
    @IBAction func twoButtonTap(_ sender: Any) {
        self.numberCounter += 1
        self.display.addToCurrent(value: "2")
        updateDisplay()
    }
    
    @IBAction func threeButtonTap(_ sender: Any) {
        self.numberCounter += 1
        self.display.addToCurrent(value: "3")
        updateDisplay()
    }
    
    @IBAction func fourButtonTap(_ sender: Any) {
        self.numberCounter += 1
        self.display.addToCurrent(value: "4")
        updateDisplay()
    }
    
    @IBAction func fiveButtonTap(_ sender: Any) {
        self.numberCounter += 1
        self.display.addToCurrent(value: "5")
        updateDisplay()
    }
    
    @IBAction func sixButtonTap(_ sender: Any) {
        self.numberCounter += 1
        self.display.addToCurrent(value: "6")
        updateDisplay()
    }
    
    @IBAction func sevenButtonTap(_ sender: Any) {
        self.numberCounter += 1
        self.display.addToCurrent(value: "7")
        updateDisplay()
    }
    
    @IBAction func eightButtonTap(_ sender: Any) {
        self.numberCounter += 1
        self.display.addToCurrent(value: "8")
        updateDisplay()
    }
    
    @IBAction func nineButtonTap(_ sender: Any) {
        self.numberCounter += 1
        self.display.addToCurrent(value: "9")
        updateDisplay()
    }
    
    @IBAction func zeroButtonTap(_ sender: Any) {
        self.numberCounter += 1
        self.display.addToCurrent(value: "0")
        updateDisplay()
    }
    @IBAction func divideButtonTap(_ sender: Any) {
        self.display.addToCurrent(value: "/")
        updateDisplay()
    }
    
    @IBAction func addButtonTap(_ sender: Any) {

        self.display.addToCurrent(value: "+")
        updateDisplay()
    }
    
    @IBAction func multiplyButtonTap(_ sender: Any) {

        self.display.addToCurrent(value: "*")
        updateDisplay()
    }
    
    @IBAction func subtractButtonTap(_ sender: Any) {

        self.display.addToCurrent(value: "-")
        updateDisplay()
    }
    
    
    
    
    
    
    
    @IBAction func enterButtonTap(_ sender: Any) {  // When enter is pressed the current element is added to the whole expression
        self.display.addExpression()
        self.display.characters += self.display.currentElement
        self.display.currentElement = ""
        self.numberCounter = 0               // resets the number counter
        enableAllButtons()                  // enables all buttons as new current element is being created
        updateDisplay()
    }
    
    @IBAction func signButtonTap(_ sender: Any) {       // Switches the sign of the current element if it is an integer
        if Int(self.display.currentElement) != nil {
            if let currentInt = Int(self.display.currentElement) {
                self.display.currentElement = String(currentInt * -1)
                updateDisplay()   // updates the dispaly with the new current element
            }
         
        }
        
    }
    
    
    
    @IBAction func evalButtonTap(_ sender: Any) {
        self.calculator.calculation(expression: self.display.expression)  //Invokes the calculation method with the expression formed with the buttons
        self.display.clear()
        self.display.characters = " = " + (calculator.result ?? "Error")  // sets the displays characters  to the result of the calculation
        updateDisplay()
        forceClearTap()  // forces the user to tap clear and restart the process
    }
    
    
    
    
    
    
    
    
// uiSetup is responsible fot programitaclly styling the buttons and creating the user interface
    
    
    func uiSetup() {
           let numberButtonArray = [signButton, clearButton, zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
           for button in numberButtonArray {
               button?.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.941, alpha: 1.0)
               button?.frame = CGRect(x: (button?.frame.origin.x)!, y: (button?.frame.origin.y)!, width: 105.0, height: 105.0)
               button?.layer.cornerRadius = 10
               
           }
           clearButton.backgroundColor = UIColor(red: 0.52, green: 0.598, blue: 0.957, alpha: 1.0)
           clearButton.setTitleColor(.white, for: .normal)
           let operaterButtonArray = [addButton, multiplyButton, subtractButton, divideButton]
           for button in operaterButtonArray {
               button?.backgroundColor = UIColor(red: 0.957, green: 0.828, blue: 0.105, alpha: 1.0)
               button?.setTitleColor(.white, for: .normal)
               button?.layer.cornerRadius = 10
           }
           enterButton.backgroundColor = UIColor(red: 0.957, green: 0.297, blue: 0.496, alpha: 1.0)
           enterButton.setTitleColor(.white, for: .normal)
           enterButton.layer.cornerRadius = 10
           evalButton.backgroundColor = UIColor(red: 0.957, green: 0.297, blue: 0.496, alpha: 1.0)
           evalButton.setTitleColor(.white, for: .normal)
           evalButton.layer.cornerRadius = 10
           displayLabel.layer.borderColor = UIColor.black.cgColor
           displayLabel.layer.borderWidth = 1.0
           displayLabel.layer.cornerRadius = 6.0
           

       }
    
}

