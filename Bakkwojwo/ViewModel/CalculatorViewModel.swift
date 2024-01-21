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
    var onUpdated: () -> Void = {}
    var operArr = [String]()
    var currentInputViewText: String = "0"
    {
        didSet {
            onUpdated()
            print("on Updated!")
        }
    }
    
    func calculate(_ k: String) {
        if k != Operator.plus.rawValue && k != Operator.minus.rawValue && k != Operator.multiply.rawValue && k != Operator.divide.rawValue && k != Operator.delete.rawValue && k != Operator.dot.rawValue {
            if self.currentInputViewText.first == "0" && self.currentInputViewText.count == 1 {
                self.currentInputViewText.removeFirst()
            }
            self.currentInputViewText = self.currentInputViewText + k
        }  else if k == "DEL" {
            if self.currentInputViewText.last == " " {
                self.currentInputViewText = String(self.currentInputViewText.dropLast(3))
            }  else if  self.currentInputViewText.count == 1 {
                self.currentInputViewText = "0"
            } else  {
                self.currentInputViewText = String(self.currentInputViewText.dropLast(1))
            }
        } else if k == "." {
            if self.currentInputViewText.last != "." &&   self.currentInputViewText.last != " " && self.operArr.last != "."{
                self.currentInputViewText = self.currentInputViewText + k
                self.operArr.append(k)
            }
        }
        else {
            if self.currentInputViewText.last != " " &&  self.currentInputViewText.last != "."{
                self.currentInputViewText = self.currentInputViewText + " " + k + " "
                self.operArr.append(k)
            }
        }
        
        let calculateValueTexts = self.currentInputViewText.split(separator: " ").map { String($0)}
        var result = Double(calculateValueTexts[0])!
        var temp = " "
        for i in 1..<calculateValueTexts.count {
            if calculateValueTexts[i] != "+" && calculateValueTexts[i] != "-" && calculateValueTexts[i] != "÷" && calculateValueTexts[i] != "×" {
                switch temp {
                case "+":
                    result = result + Double(calculateValueTexts[i])!
                case "-":
                    result = result - Double(calculateValueTexts[i])!
                case "×":
                    result = result * Double(calculateValueTexts[i])!
                case "÷":
                    result = result / Double(calculateValueTexts[i])!
                default:
                    break
                }
            } else {
                temp = calculateValueTexts[i]
            }
        }
    }
}

