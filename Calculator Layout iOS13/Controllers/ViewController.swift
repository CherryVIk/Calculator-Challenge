//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping = true
    
    private var calculatorBrain = CalculatorBrain()
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Found odd character in displayLabel")
            }
            return number
        }
        set{
            if isInt() {
                displayLabel.text = String(format: "%0.f", newValue)
            }
            displayLabel.text = String(newValue)
            print("\(displayLabel.text!) - inside set")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "0"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let number = sender.currentTitle{
            if isFinishedTyping {
                isFinishedTyping = false
                displayLabel.text = number
                print(displayLabel.text! + " - uppper numpressed")
            } else {
                if number == "." {
                    if !isInt() {
                        return
                    }
                }
                print(displayLabel.text! + " - lower numpressed")
                displayLabel.text = displayLabel.text! + number
                
            }
        }
    }
    
    
    func isInt() -> Bool {
        let number = displayValue
        return floor(number) == number
       }
    
     
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
      
        calculatorBrain.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculatorBrain.checkMethod(calcMethod){
                  displayValue = result
            }
         
           
        }
        
        
    }
    
   
}

