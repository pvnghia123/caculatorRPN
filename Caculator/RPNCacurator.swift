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
        for character in mathString {
            if isOperator(c: character) { // neu la toan tu
                if character == "(" {
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
                        arrayMath.append(String(arrayOperation[item]))
                        arrayOperation.removeLast()
                    }
                } else { // neu la /*+-
                    if output != "" {
                        arrayMath.append(output)
                        output = ""
                    }
                    let laststack:Character? = arrayOperation.last
                    if laststack == nil || laststack == "(" {
                        arrayOperation.append(character)
                        continue
                    }
                    if priorityOperator(c: laststack!) <= priorityOperator(c: character) {
                        arrayMath.append(String(laststack!))
                        arrayOperation.removeLast()
                    }
                    arrayOperation.append(character)
                }
            } else {
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
        print("arrymath:\(arrayMath.description)")
        return arrayMath
    }
    func catulator(mathString: String) {
        //convert kiphap ba lan nguoc
        let resultConvert: [String] = convertpostfixRPN(mathString: mathString)
        var stackMath:[Double] = []
        //tinhtoan
        for item in resultConvert {
                if item.count == 1 {
                    if isOperator(c: Character(item)) {
                        guard let number1: Double = stackMath.last else {
                            delegate?.onFalse(index: stackMath.count)
                            return
                        }
                        stackMath.removeLast()
                        
                        guard let number2: Double = stackMath.last else {
                            delegate?.onFalse(index: stackMath.count)
                            return
                        }
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
        delegate?.onsuccess(result: stackMath.last!)
    }
}
