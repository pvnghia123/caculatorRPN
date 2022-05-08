//
//  ViewController.swift
//  Caculator
//
//  Created by Nghia Pham on 07/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOpenNgoac: UIButton!
    @IBOutlet weak var buttonCloseNgoac: UIButton!
    
    @IBOutlet weak var buttonDelete: UIButton!
    @IBOutlet weak var buttonDeleteAll: UIButton!
    
    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonMultiplication: UIButton!
    @IBOutlet weak var buttonSubtraction: UIButton!
    @IBOutlet weak var buttonSum: UIButton!
    
    @IBOutlet weak var buttonDot: UIButton!
    @IBOutlet weak var butonNumber0: UIButton!
    @IBOutlet weak var buttonNumber1: UIButton!
    @IBOutlet weak var buttonNumber2: UIButton!
    @IBOutlet weak var buttonNumber3: UIButton!
    @IBOutlet weak var buttonNumber4: UIButton!
    @IBOutlet weak var buttonNumber5: UIButton!
    @IBOutlet weak var buttonNumber6: UIButton!
    @IBOutlet weak var buttonNumber7: UIButton!
    @IBOutlet weak var buttonNumber8: UIButton!
    @IBOutlet weak var buttonNumber9: UIButton!
    
    @IBOutlet weak var buttonCaculator: UIButton!
    @IBOutlet weak var textMath: UITextView!
    @IBOutlet weak var textResult: UITextView!
    
    var stringMath:String = ""
    var stringMathCaculator:String = ""

    var caculatorRPN = RPNCacurator()
    override func viewDidLoad() {
        super.viewDidLoad()
        caculatorRPN.delegate =  self
        
       // let result:Double =  test.catulator(mathString: "10-55+5*3")
       // print("output :\(result)")
    }
  
    @IBAction func buttonOpenNgoacOnTouch(_ sender: Any) {
        stringMath = stringMath + "("
        textMath.text  = stringMath
        
    }
    @IBAction func buttonCloseNgoacOnTouch(_ sender: Any) {
        stringMath = stringMath + ")"
        textMath.text  = stringMath
        
    }
    @IBAction func buttonDeleteOnTouch(_ sender: Any) {
        stringMath.removeLast()
        textMath.text  = stringMath
    }
    @IBAction func buttonDeleteAllOnTouch(_ sender: Any) {
        stringMath = ""
        textMath.text = ""
        textResult.text = ""
    }
    @IBAction func buttonDivisionOnTouch(_ sender: Any) {
        stringMath = stringMath + "/"
        textMath.text  = stringMath
        
    }
    @IBAction func buttonMultiplicationOnTouch(_ sender: Any) {
        stringMath = stringMath + "*"
        textMath.text  = stringMath
        
    }
    @IBAction func buttonSubtractionOnTouch(_ sender: Any) {
        stringMath = stringMath + "-"
        textMath.text  = stringMath
    
    }
    @IBAction func buttonSumOnTouch(_ sender: Any) {
        stringMath = stringMath + "+"
        textMath.text  = stringMath
        
    }
    @IBAction func buttonDotOnTouch(_ sender: Any) {
        stringMath = stringMath + "."
        textMath.text  = stringMath
        
    }
    @IBAction func butonNumber0OnTouch(_ sender: Any) {
        stringMath = stringMath + "0"
        textMath.text  = stringMath
        
    }
    @IBAction func butonNumber1OnTouch(_ sender: Any) {
        stringMath = stringMath + "1"
        textMath.text  = stringMath
        
    }
    @IBAction func butonNumber2OnTouch(_ sender: Any) {
        stringMath = stringMath + "2"
        textMath.text  = stringMath
        
    }
    @IBAction func butonNumber3OnTouch(_ sender: Any) {
        stringMath = stringMath + "3"
        textMath.text  = stringMath
        
    }
    @IBAction func butonNumber4OnTouch(_ sender: Any) {
        stringMath = stringMath + "4"
        textMath.text  = stringMath
        
    }
    @IBAction func butonNumber5OnTouch(_ sender: Any) {
        stringMath = stringMath + "5"
        textMath.text  = stringMath
        
    }
    @IBAction func butonNumber6OnTouch(_ sender: Any) {
        stringMath = stringMath + "6"
        textMath.text  = stringMath
        
    }
    @IBAction func butonNumber7OnTouch(_ sender: Any) {
        stringMath = stringMath + "7"
        textMath.text  = stringMath
        
    }
    @IBAction func butonNumber8OnTouch(_ sender: Any) {
        stringMath = stringMath + "8"
        textMath.text  = stringMath
        
    }
    @IBAction func butonNumber9OnTouch(_ sender: Any) {
        stringMath = stringMath + "9"
        textMath.text  = stringMath
        
    }
    @IBAction func butonCaculatorOnTouch(_ sender: Any) {
        caculatorRPN.catulator(mathString: stringMath)
    }
//    func validateStringMathCaculator(text: String) {
//
//        var numberOperator: Int = 0
//
//        text.forEach { character in
//            if caculatorRPN.isOperator(c: character) {
//                numberOperator = numberOperator + 1
//                if numberOperator == 2 {
//                    if NSTemporaryDirectory()
//                }
//
//            } else {
//                if numberOperator != 0 {
//                    numberOperator = 0
//                }
//            }
//            var temp:Character = character
//        }
//    }
    
}

extension ViewController :RPNCaculatorDelagate {
    func onFalse(index: Int) {
        textResult.text = "ERROR !"
    }
    func onsuccess(result: Double) {
        textResult.text = result.description
    }
}
