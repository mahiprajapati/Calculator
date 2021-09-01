//
//  ViewController.swift
//  calculator_mahesh
//
//  Created by Mahesh on 07/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

enum Operation: String {
    case Add = "+"
    case Substract = "-"
    case multiply = "*"
    case divide = "/"
    case NULL = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var output_lbl: UILabel!
    
    var runningNumber = ""
    var leftNumber = ""
    var rightNumber = ""
    var result = ""
    var currentOperation: Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()

        output_lbl.text = "0"

    }

    @IBAction func numberPresed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
        runningNumber += "\(sender.tag)"
        output_lbl.text = runningNumber
        }
        
    }
    @IBAction func allClearPressed(_ sender: RoundButton) {
        
        runningNumber = ""
        leftNumber = ""
        rightNumber = ""
        result = ""
        currentOperation = .NULL
        output_lbl.text = "0"
        
    }
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
        runningNumber += "."
        output_lbl.text = runningNumber
        }
    }
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Substract)
    }
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .multiply)
    }
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .divide)
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            
            if runningNumber != "" {
                rightNumber = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftNumber)! + Double(rightNumber)!)"
                }else if currentOperation == .Substract {
                    result = "\(Double(leftNumber)! - Double(rightNumber)!)"
                }else if currentOperation == .multiply {
                    result = "\(Double(leftNumber)! * Double(rightNumber)!)"
                }else if currentOperation == .divide {
                    result = "\(Double(leftNumber)! / Double(rightNumber)!)"
                }
                leftNumber = result
                
                if ((Double(result)!.truncatingRemainder(dividingBy: 1)) == 0){
                    result = "\(Int(Double(result)!))"
                }
                
                output_lbl.text = result
            }
                currentOperation = operation
            }else {
                leftNumber = runningNumber
                runningNumber = ""
                currentOperation = operation
        }
    }
    
}

