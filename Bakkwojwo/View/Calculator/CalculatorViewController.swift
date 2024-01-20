//
//  CalculatorViewController.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/11/24.
//

import UIKit
import SnapKit

class CalculatorViewController: BaseViewController {
    
    private var operArr = [String]()
    let CalculatorKey = CalculatorView()
    let CalculatorResult  = CalculatorResultView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIScreen.main.bounds.size.height/2.3)
        self.CalculatorKey.delegate = self
    }
    
    override func setView() {
        self.view.backgroundColor = .white
        [self.CalculatorKey, self.CalculatorResult].forEach { self.view.addSubview($0)}
    }
    
    override func setAutoLayout() {
        self.CalculatorKey.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3.0)
            
            self.CalculatorResult.snp.makeConstraints {
                $0.width.equalTo(UIScreen.main.bounds.size.width)
                $0.height.equalTo(UIScreen.main.bounds.size.height / 13.0)
                $0.bottom.equalTo(self.CalculatorKey.snp.top)
            }
        }
    }
}

extension CalculatorViewController: CalculatorViewDelegate {
    func calculator(_ k: String)  {
        //        // inPutOperatorView의 Text가 0이고, 입력하는
        //        if k != "DEL" && self.CalculatorResult.inputOperatorView.text?.first == "0"{
        //            self.CalculatorResult.inputOperatorView.text?.removeFirst()
        //        }
        
        print(self.CalculatorResult.inputOperatorView.text)
        // 큰 if -> 숫자 패드를 눌렀을 때 0을 지우고 k로 이어감.
        if k != "+" && k != "-" && k != "÷" && k != "×" && k != "DEL" && k != "." {
            if self.CalculatorResult.inputOperatorView.text?.first == "0" && self.CalculatorResult.inputOperatorView.text?.count == 1 {
                self.CalculatorResult.inputOperatorView.text?.removeFirst()
            }
            self.CalculatorResult.inputOperatorView.text = self.CalculatorResult.inputOperatorView.text! + k
        }  else if k == "DEL" { // 큰 DEL 눌렀을 때는 예외처리
            if self.CalculatorResult.inputOperatorView.text?.last == " " {
                self.CalculatorResult.inputOperatorView.text = String(self.CalculatorResult.inputOperatorView.text!.dropLast(3))
            }  else if  self.CalculatorResult.inputOperatorView.text?.count == 1 {
                self.CalculatorResult.inputOperatorView.text = "0"
            } else  {
                self.CalculatorResult.inputOperatorView.text = String(self.CalculatorResult.inputOperatorView.text!.dropLast(1))
            }
        } else if k == "." {
            if self.CalculatorResult.inputOperatorView.text?.last != "." &&   self.CalculatorResult.inputOperatorView.text?.last != " " && self.operArr.last != "."{
                self.CalculatorResult.inputOperatorView.text = self.CalculatorResult.inputOperatorView.text! + k
                self.operArr.append(k)
            }
        }
        else {
            if self.CalculatorResult.inputOperatorView.text?.last != " " &&  self.CalculatorResult.inputOperatorView.text?.last != "."{
                self.CalculatorResult.inputOperatorView.text = self.CalculatorResult.inputOperatorView.text! + " " + k + " "
                self.operArr.append(k)
            }
        }
        
        guard let inputViewText: String = self.CalculatorResult.inputOperatorView.text else { return }
        
        let calculateValueTexts: [String] = inputViewText.split(separator: " ").map {String($0)}
        var result = Double(calculateValueTexts[0])!
        print(calculateValueTexts)
        print(operArr)
        var tempOperation = ""
        for i in 1..<calculateValueTexts.count {
            if calculateValueTexts[i] != "+" && calculateValueTexts[i] != "-" && calculateValueTexts[i] != "÷" && calculateValueTexts[i] != "×" {
                switch tempOperation {
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
                tempOperation = calculateValueTexts[i]
            }
        }
        self.CalculatorResult.resultView.text = String(result)
        print(result)
    }
}
