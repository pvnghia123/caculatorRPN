//
//  RPNCacurator.swift
//  Caculator
//
//  Created by Nghia Pham on 07/05/2022.
//

import UIKit

protocol RPNCaculatorDelagate {
    func onFalse(index: Int)
    func onsuccess(result: Double)
}
class RPNCacurator: NSObject {
    var delegate:RPNCaculatorDelagate?
   // var arrayMath: [String] = []
    func isOperator(c: Character) -> Bool {
        let arrayOperator: [Character] = ["(" , ")", "/", "*", "+", "-"]
        let index = arrayOperator.firstIndex(of: c)
        if index != nil {
            return true
        }
        return false
        // return false
    }
    func priorityOperator(c: Character) -> Int {
        if c == "(" || c == ")" {
            return 0
        } else if c == "/" || c == "*" {
            return 1
        } else {
            return 2
        }
    }
    func convertpostfixRPN(mathString: String) -> [String] {
        var output:String = ""
        var arrayOperation: [Character] = []
        var arrayMath: [String] = []
        //var arrayStringMath: [Character] = Array(mathString)
        
        for character in mathString {
            if isOperator(c: character) { // neu la toan tu
                if character == "(" { // neu la ( thi them vao stack
                    arrayOperation.append("(")
                } else if character == ")" {
                    if output != "" {
                        arrayMath.append(output)
                        output = ""
                    }
                    let i:Int = arrayOperation.count - 1
                    for item in stride(from: i, through: 0, by: -1) {
                        if arrayOperation[item] == "(" {
                            arrayOperation.removeLast()
                            break
                        }
                        //output.append(arrayOperation[item])
                        arrayMath.append(String(arrayOperation[item]))
                        arrayOperation.removeLast()
                    }
                    //output = ""
                } else { // neu la toan tu /*+-
                    if output != "" {
                        arrayMath.append(output)
                        output = ""
                    }
                    let laststack:Character = arrayOperation.last ?? "Z"
                    if laststack == "Z" || laststack == "(" {
                        arrayOperation.append(character)
                        continue
                    }
                
                    if priorityOperator(c: laststack) <= priorityOperator(c: character) {
                        //output.append(laststack)
                        arrayMath.append(String(laststack))
                        arrayOperation.removeLast()
                       
                    }
                    arrayOperation.append(character)
                 
                }
                // khi doc duowcj kitu
            } else { // neu la toan hang
                output.append(character)
            }
        }
        arrayMath.append(output)
        if arrayOperation.count > 0 {
            let i:Int = arrayOperation.count - 1
            for item in stride(from: i, through: 0, by: -1) {
                output.append(arrayOperation[item])
                arrayMath.append(String(arrayOperation[item]))
                arrayOperation.removeLast()
            }
        }
        //print("output:\(output)")
        print("arrymath:\(arrayMath.description)")
        return arrayMath
    }
    func catulator(mathString: String) {
        //convert kiphap ba lan nguoc
        
        let resultConvert: [String] = convertpostfixRPN(mathString: mathString)
        var stackMath:[Double] = []
        
        for item in resultConvert {
            //do {
                if item.count == 1 {
                    if isOperator(c: Character(item)) {
                        
                        guard let lastArray: Double = stackMath.last else {
                            delegate?.onFalse(index: stackMath.count)
                            return
                        }
                        let number1:Double = lastArray
                        stackMath.removeLast()
                        
                        guard let lastArray: Double = stackMath.last else {
                            delegate?.onFalse(index: stackMath.count)
                            return
                        }
                        let number2:Double = lastArray
                        stackMath.removeLast()
                        
                        switch item {
                        case "+":
                            let result = number1 + number2
                            stackMath.append(result)
                            break
                        case "-":
                            let result = number2 - number1
                            stackMath.append(result)
                            break
                        case "/":
                            let result = number2 / number1
                            stackMath.append(result)
                            break
                        case "*":
                            let result = number1 * number2
                            stackMath.append(result)
                            break
                        default:
                            let result = number1 + number2
                            stackMath.append(result)
                            break
                            
                        }
                    } else {
                        guard let number: Double = Double(item) else {
                            delegate?.onFalse(index: stackMath.count)
                            return
                        }
                        stackMath.append(number)
                    }
                    
                } else {
                    guard let number: Double = Double(item) else {
                        delegate?.onFalse(index: stackMath.count)
                        return
                    }
                    stackMath.append(number)
                }
            
                
        }
        //return stackMath.last!
        delegate?.onsuccess(result: stackMath.last!)
        
    }
}
