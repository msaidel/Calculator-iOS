//
//  ViewController.swift
//  myCalculator
//
//  Created by Marcela Saidel on 05/09/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnInvert: UIButton!
    @IBOutlet weak var btnPercent: UIButton!
    @IBOutlet weak var btnDivided: UIButton!
    @IBOutlet weak var btnMult: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnSum: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnComma: UIButton!
    @IBOutlet weak var btn_0: UIButton!
    @IBOutlet weak var btn_1: UIButton!
    @IBOutlet weak var btn_2: UIButton!
    @IBOutlet weak var btn_3: UIButton!
    @IBOutlet weak var btn_4: UIButton!
    @IBOutlet weak var btn_5: UIButton!
    @IBOutlet weak var btn_6: UIButton!
    @IBOutlet weak var btn_7: UIButton!
    @IBOutlet weak var btn_8: UIButton!
    @IBOutlet weak var btn_9: UIButton!
    
    @IBOutlet weak var lblValue: UILabel!
    
    var initialValue: Int = 0
    var stringOperationForResult = ""
    var hasOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblValue.text = String(initialValue)
        setupCornerButtons()
    }

    func setupCornerButtons() {
      
        btnAC.layer.cornerRadius = btnAC.bounds.height / 2
        btnInvert.layer.cornerRadius = btnInvert.bounds.height / 2
        btnPercent.layer.cornerRadius = btnPercent.bounds.height / 2
        btnDivided.layer.cornerRadius = btnDivided.bounds.height / 2
        btnMult.layer.cornerRadius = btnMult.bounds.height / 2
        btnMinus.layer.cornerRadius = btnMinus.bounds.height / 2
        btnSum.layer.cornerRadius = btnSum.bounds.height / 2
        btnEqual.layer.cornerRadius = btnEqual.bounds.height / 2
        btnComma.layer.cornerRadius = btnComma.bounds.height / 2
        btn_0.layer.cornerRadius = btn_0.bounds.height / 2
        btn_1.layer.cornerRadius = btn_1.bounds.height / 2
        btn_2.layer.cornerRadius = btn_2.bounds.height / 2
        btn_3.layer.cornerRadius = btn_3.bounds.height / 2
        btn_4.layer.cornerRadius = btn_4.bounds.height / 2
        btn_5.layer.cornerRadius = btn_5.bounds.height / 2
        btn_6.layer.cornerRadius = btn_6.bounds.height / 2
        btn_7.layer.cornerRadius = btn_7.bounds.height / 2
        btn_8.layer.cornerRadius = btn_8.bounds.height / 2
        btn_9.layer.cornerRadius = btn_9.bounds.height / 2
        
    }

    func setText(number: String) {
        
         var displayValue = ""
         
         if hasOperation {
    
             if number == "." {
                displayValue  = "0."
             } else {
                displayValue = "\(number)"
             }
             
         } else {
      
             if lblValue.text  == "0" {
                 if number == "." {
                   displayValue  = "0."
                 } else {
                    displayValue = "\(number)"
                 }
             }
             else if let text = lblValue.text  {
                 displayValue  = "\(text)\(number)"
             }
         }
         
         lblValue.text = displayValue
         
         let oldStringOperation =  stringOperationForResult
                              
         let newStringOperation = "\(oldStringOperation)\(number)"
         stringOperationForResult = newStringOperation
         
         
     }
    
    func clearValue() {
        
        lblValue.text = String(initialValue)
        stringOperationForResult = ""
        hasOperation = false
        
    }
    
    @IBAction func tapClear(_ sender: Any) { clearValue() }
    
    @IBAction func tapButtons(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
           setText(number: "0")
        case 1:
            setText(number: "1")
        case 2:
           setText(number: "2")
        case 3:
           setText(number: "3")
        case 4:
           setText(number: "4")
        case 5:
           setText(number: "5")
        case 6:
           setText(number: "6")
        case 7:
           setText(number: "7")
        case 8:
           setText(number: "8")
        case 9:
           setText(number: "9")
        case 10:
            setText(number: ".")
         default: break
        
        }
        
    }
    
    
    
    
    
    @IBAction func tapOperationsButtons(_ sender: UIButton) {
        
       let tag = sender.tag
        
       hasOperation = true
         
        if tag == 12 {
           stringOperationForResult = "\(stringOperationForResult)/"
        } else if tag == 13 {
          stringOperationForResult = "\(stringOperationForResult)*"
        } else if tag == 14 {
          stringOperationForResult = "\(stringOperationForResult)-"
        } else if tag == 15 {
          stringOperationForResult = "\(stringOperationForResult)+"

        } 
    
    }
    
     
    @IBAction func tapResult(_ sender: Any) {
        
        print("resultado: \(stringOperationForResult)")
        let exp: NSExpression = NSExpression(format: stringOperationForResult)
        let result: Double = exp.expressionValue(with:nil, context: nil) as! Double // 25
        lblValue.text = String(result)
        
        stringOperationForResult = ""
        hasOperation = false

    }
    

    
}

