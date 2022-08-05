//
//  ViewController.swift
//  Calculator
//
//  Created by Donizetti de Souza on 8/4/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func fillingNumbers1(number: String, actualNumber: String, aux: Bool) -> String {
        
        var actualNumber = actualNumber
        
        if (aux == false){
            actualNumber += number
        }
        return actualNumber
    }
    
    func fillingNumbers2(number: String, actualNumber: String, aux: Bool) -> String {
        
        var actualNumber = actualNumber
        
        if (aux == true){
            actualNumber += number
        }
        return actualNumber
    }
    
    func showTextLabel(number1: String, number2: String, aux: Bool) {
        var number: String = ""
        if(aux == false){
            number = number1
        } else{
            number = number2
        }
        showText.text = "\(number)"
    }
    
    func calculating(number1: String, number2: String, operation: String){
        var result: Float = 0
        if(operation == "+"){
            result = Float(number1)! + Float(number2)!
        } else if(operation == "-"){
            result = Float(number1)! - Float(number2)!
        } else if(operation == "*"){
            result = Float(number1)! * Float(number2)!
        }
        else{
            result = Float(number1)! / Float(number2)!
        }
        showText.text = "\(result)"
    }
        
    var n1: String = ""
    var n2: String = ""
    var result: Float = 0
    var auxNum: Bool = false
    var typeOperation: String = ""

    @IBOutlet weak var showText: UILabel!
    
    @IBAction func button1(_ sender: Any) {
        n1 = fillingNumbers1(number: "1", actualNumber: n1, aux: auxNum)
        n2 = fillingNumbers2(number: "1", actualNumber: n2, aux: auxNum)
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
        print("N1, \(n1)")
        print("N2, \(n2)")
    }
    
    @IBAction func button2(_ sender: Any) {
        n1 = fillingNumbers1(number: "2", actualNumber: n1, aux: auxNum)
        n2 = fillingNumbers2(number: "2", actualNumber: n2, aux: auxNum)
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
        print("N1, \(n1)")
        print("N2, \(n2)")
    }
    
    @IBAction func button3(_ sender: Any) {
        n1 = fillingNumbers1(number: "3", actualNumber: n1, aux: auxNum)
        n2 = fillingNumbers2(number: "3", actualNumber: n2, aux: auxNum)
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
    }
    
    @IBAction func button4(_ sender: Any) {
        n1 = fillingNumbers1(number: "4", actualNumber: n1, aux: auxNum)
        n2 = fillingNumbers2(number: "4", actualNumber: n2, aux: auxNum)
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
    }
    
    @IBAction func button5(_ sender: Any) {
        n1 = fillingNumbers1(number: "5", actualNumber: n1, aux: auxNum)
        n2 = fillingNumbers2(number: "5", actualNumber: n2, aux: auxNum)
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
    }
    
    @IBAction func button6(_ sender: Any) {
        n1 = fillingNumbers1(number: "6", actualNumber: n1, aux: auxNum)
        n2 = fillingNumbers2(number: "6", actualNumber: n2, aux: auxNum)
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
    }
    
    @IBAction func button7(_ sender: Any) {
        n1 = fillingNumbers1(number: "7", actualNumber: n1, aux: auxNum)
        n2 = fillingNumbers2(number: "7", actualNumber: n2, aux: auxNum)
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
    }
    
    @IBAction func button8(_ sender: Any) {
        n1 = fillingNumbers1(number: "8", actualNumber: n1, aux: auxNum)
        n2 = fillingNumbers2(number: "8", actualNumber: n2, aux: auxNum)
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
    }
    
    @IBAction func button9(_ sender: Any) {
        n1 = fillingNumbers1(number: "9", actualNumber: n1, aux: auxNum)
        n2 = fillingNumbers2(number: "9", actualNumber: n2, aux: auxNum)
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
    }
    
    @IBAction func button0(_ sender: Any) {
        n1 = fillingNumbers1(number: "0", actualNumber: n1, aux: auxNum)
        n2 = fillingNumbers2(number: "0", actualNumber: n2, aux: auxNum)
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
    }
    
    @IBAction func buttonPlus(_ sender: Any) {
        typeOperation = "+"
        auxNum = true
        showText.text = ""
    }
    
    @IBAction func buttonLess(_ sender: Any) {
        typeOperation = "-"
        auxNum = true
        showText.text = ""
    }
    
    @IBAction func buttonMult(_ sender: Any) {
        typeOperation = "*"
        auxNum = true
        showText.text = ""
    }
    
    @IBAction func buttonShare(_ sender: Any) {
        typeOperation = "/"
        auxNum = true
        showText.text = ""
    }
    
    @IBAction func buttonEqual(_ sender: Any) {
        calculating(number1: n1, number2: n2, operation: typeOperation)
        n1 = ""
        n2 = ""
        auxNum = false
        typeOperation = ""
    }
    
        
    @IBAction func buttonClear(_ sender: Any) {
        n1 = ""
        n2 = ""
        auxNum = false
        typeOperation = ""
        showTextLabel(number1: n1, number2: n2, aux: auxNum)
    }
    
}

