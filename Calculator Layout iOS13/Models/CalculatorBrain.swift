//
//  CalculatorBrain.swift
//  Calculator Layout iOS13
//
//  Created by Victoria Boichenko on 14.08.2020.
//

import Foundation

struct CalculatorBrain {
    private var number : Double?
    
    private var intermediateCalculation : (firstNum: Double, operation: String)?
    private let operations = ["+", "-", "/", "*", "="]
    
    mutating func setNumber(_ number: Double){
        self.number = number
        //        if intermediateCalculation.firstNum == nil {
        //            intermediateCalculation.firstNum = number
        //            print("First intermediateCalculation is filled with \(intermediateCalculation.firstNum)")
        //        }
    }
    
    mutating func checkMethod(_ method: String) -> Double? {
        if let num = number {
            switch method {
            case "+/-":
                return num * (-1)
            case "AC":
                return 0
            case "%":
                return num / 100
            case "=":
                return calculate(secondNum: num)
            default:
                intermediateCalculation = (firstNum: num, operation: method)
            }
        }
        return nil
        
    }
    
    
    private func calculate(secondNum: Double) -> Double? {
        if let firstNum = intermediateCalculation?.firstNum , let operation = intermediateCalculation?.operation {
            
            switch operation {
            case "+":
                return (firstNum + secondNum)
            case "-":
                return (firstNum - secondNum)
            case "÷":
                if secondNum == 0 {
                    return nil
                }else {
                    return (firstNum / secondNum)
                }
            case "*":
                return (firstNum * secondNum)
            case "=":
                return secondNum
            default:
                fatalError("The given operation is absent in the list of cases")
            }
        }
        return nil
        
        
    }
    
    
    
}

