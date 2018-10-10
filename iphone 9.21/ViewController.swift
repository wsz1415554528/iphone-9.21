//
//  ViewController.swift
//  iphone 9.21
//
//  Created by s20161104602 on 2018/9/21.
//  Copyright © 2018年 s20161104602. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lableResult: UILabel!
    
    var firstOperand: Double = 0.0

    var secondOperand: Double = 0.0
  
    var decimalPointFlag: Bool = false
  
    var isSecond: Bool = false
  
    var operatorFlag: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func buttonTap(sender: UIButton) {
       
        if lableResult.text == "0" || (isSecond && secondOperand == 0.0) {
            
            lableResult.text = ""
        }
       
        lableResult.text = lableResult.text! + sender.titleLabel!.text!
        
        if isSecond {
            
            secondOperand = NSString(string: lableResult.text!).doubleValue
        }else {
           
            firstOperand = NSString(string: lableResult.text!).doubleValue
        }
        print(firstOperand)
    }
    
    
    @IBAction func decimalPointTap() {
        
        if !decimalPointFlag {
            lableResult.text = lableResult.text! + "."
            if isSecond {
                secondOperand = (lableResult.text! as NSString).doubleValue
            }else {
                firstOperand = (lableResult.text! as NSString).doubleValue
            }
            
            decimalPointFlag = !decimalPointFlag
        }
    }
    
    
    @IBAction func operatorTap(sender: UIButton) {
        if firstOperand != 0 {
            isSecond = true
            decimalPointFlag = false
            switch sender.titleLabel!.text! {
            case "+":
                operatorFlag = "+"
            case "-":
                operatorFlag = "-"
            case "*":
                operatorFlag = "*"
            case "÷":
                operatorFlag = "/"
            default:
                operatorFlag = " "
            }
        }
    }
    
    
    @IBAction func resultTap(sender: UIButton) {
        //确保第二操作数有值
        if isSecond {
            //除数不能为0
            if operatorFlag == "/" && secondOperand == 0 {
                print("Error: 除数不能为0")
                return
            }
            
            var result: Double = 0.0
            switch operatorFlag {
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case  "*":
                result = firstOperand * secondOperand
            case  "/":
                result = firstOperand / secondOperand
            default :
                result = 0.0
            }
            
            lableResult.text = result.description
            print("第一操作: \(firstOperand)")
            print("操作符: \(operatorFlag)")
            print("第二操作: \(secondOperand)")
            print("结果: \(result)")
            
        }
        
    }
    
    @IBAction func clear(sender: UIButton) {
        
       
        lableResult.text = "0"
        
        
        firstOperand = 0.0
        
       
        secondOperand = 0.0
        
        
        decimalPointFlag = false
        
        
        isSecond = false
        
        
        operatorFlag = ""
        
    }
}
func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }




