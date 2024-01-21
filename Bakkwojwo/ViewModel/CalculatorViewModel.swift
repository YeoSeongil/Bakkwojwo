//
//  CalculatorViewModel.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/21/24.
//

import Foundation

enum Operator: String {
    case plus = "+"
    case minus = "-"
    case multiply = "×"
    case divide = "÷"
    case dot = "."
    case delete = "DEL"
}

class CalculatorViewModel {
    var onInputViewUpdated: () -> Void = {}
    var onResultViewUpdated: () -> Void = {}
    var operArr = [String]()
    
    var currentInputViewString: String = "0"
    {
        didSet {
            onInputViewUpdated()
        }
    }
    
    var currentResultString: String = "0"
    {
        didSet {
            onResultViewUpdated()
        }
    }
    
    func numberKeyTapped(_ number: String) {
        if self.currentInputViewString.first == "0" && self.currentInputViewString.count == 1 {
            self.currentInputViewString.removeFirst()
        }
        self.currentInputViewString += number
        self.currentResultString = self.calculate(self.currentInputViewString)
    }
    
    func operatorKeyTapped(_ oper: String) {
        if oper == Operator.dot.rawValue {
            if self.currentInputViewString.last != " " && self.currentInputViewString.last != "." && self.operArr.last != Operator.dot.rawValue  {
                self.currentInputViewString +=  Operator.dot.rawValue
                self.operArr.append(Operator.dot.rawValue)
                self.currentResultString = self.calculate(self.currentInputViewString)
            }
        }
        
        else if oper == Operator.delete.rawValue {
            if self.currentInputViewString.last == " " {
                self.currentInputViewString = String(self.currentInputViewString.dropLast(3))
            }  else if  self.currentInputViewString.count == 1 {
                self.currentInputViewString = "0"
            } else  {
                self.currentInputViewString = String(self.currentInputViewString.dropLast(1))
            }
            self.currentResultString = self.calculate(self.currentInputViewString)
        }
        else {
            if self.currentInputViewString.last != " " &&  self.currentInputViewString.last != "."{
                self.currentInputViewString = self.currentInputViewString + " " + oper  + " "
                self.operArr.append(oper)
                self.currentResultString = self.calculate(self.currentInputViewString)
            }
        }
    }
    
    func calculate(_ k: String) -> String{
        let inputViewString = self.currentInputViewString.split(separator: " ").map { String($0)}
        var result = Double(inputViewString[0])!
        var temp = " "
        for key in 1..<inputViewString.count {
            if inputViewString[key] != Operator.plus.rawValue && inputViewString[key] != Operator.minus.rawValue && inputViewString[key] != Operator.divide.rawValue && inputViewString[key] != Operator.multiply.rawValue {
                switch temp {
                case Operator.plus.rawValue:
                    result = result + Double(inputViewString[key])!
                case Operator.minus.rawValue:
                    result = result - Double(inputViewString[key])!
                case Operator.multiply.rawValue:
                    result = result * Double(inputViewString[key])!
                case Operator.divide.rawValue:
                    result = result / Double(inputViewString[key])!
                default:
                    break
                }
            } else {
                temp = inputViewString[key]
            }
        }
        return String(result)
    }
}

