//
//  CalculatorView.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/16/24.
//

import Foundation
import UIKit
import SnapKit

protocol CalculatorViewDelegate {
    func onUpdateInputView(_ k: String)
}

class CalculatorView: BaseView {
    var delegate: CalculatorViewDelegate?
    let dotButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: ".")
        return key
    }()
    
    let zeroButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "0")
        return key
    }()
    
    let divButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "÷")
        return key
    }()
    
    let mulButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "×")
        return key
    }()
    
    let minButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "-")
        return key
    }()
    
    let sumButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "+")
        return key
    }()
    
    let delButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "DEL")
        return key
    }()
    
    let oneButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "1")
        return key
    }()
    
    let twoButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "2")
        return key
    }()
    
    let threeButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "3")
        return key
    }()
    
    let fourButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "4")
        return key
    }()    
    
    let fiveButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "5")
        return key
    }()    
    
    let sixButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "6")
        return key
    }()    
    
    let sevenButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "7")
        return key
    }()    
    
    let eightButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "8")
        return key
    }()    
    
    let nineButton: CalculatorKey = {
        let key = CalculatorKey(keyTitle: "9")
        return key
    }()
    
    override func setView() {
        [self.dotButton, self.zeroButton, self.divButton, self.mulButton, self.oneButton, self.twoButton, self.threeButton, self.minButton, self.fourButton, self.fiveButton, self.sixButton, self.sumButton, self.sevenButton, self.eightButton, self.nineButton, self.delButton].forEach {
            self.addSubview($0) }
        
        [self.dotButton, self.zeroButton, self.divButton, self.mulButton, self.oneButton, self.twoButton, self.threeButton, self.minButton, self.fourButton, self.fiveButton, self.sixButton, self.sumButton, self.sevenButton, self.eightButton, self.nineButton, self.delButton].forEach {
            $0.buttonTapped = { k in
                self.delegate?.onUpdateInputView(k)
            } }
    }
    
    override func setAutoLayout() {
        
        self.dotButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width / 4.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }
        
        self.zeroButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / 4.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }
        
        self.divButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0 / 2.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / (4.0))
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }        
        
        self.mulButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0 / 3.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / (4.0))
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }       
        
        self.oneButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0)))
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width / 4.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }        
        
        self.twoButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0)))
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / 4.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }        
        
        self.threeButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0)))
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0 / 2.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / 4.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }
        
        self.minButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0)))
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0 / 3.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / (4.0))
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }        
        
        self.fourButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0) / 2))
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width / 4.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }        
        
        self.fiveButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0) / 2))
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / 4.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }
        
        self.sixButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0) / 2))
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0 / 2.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / (4.0))
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }
        
        self.sumButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0) / 2))
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0 / 3.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / (4.0))
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }        
        
        self.sevenButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0) / 3))
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width / 4.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }        
        
        self.eightButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0) / 3))
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / 4.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }
        
        self.nineButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0) / 3))
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0 / 2.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / (4.0))
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }
        
        self.delButton.snp.makeConstraints {
            $0.bottom.equalTo(super.safeAreaLayoutGuide.snp.bottom).offset(UIScreen.main.bounds.height / -((3.0 * 4.0) / 3))
            $0.leading.equalTo(super.safeAreaLayoutGuide.snp.leading).offset(UIScreen.main.bounds.width / (4.0 / 3.0))
            $0.width.equalTo(UIScreen.main.bounds.size.width / (4.0))
            $0.height.equalTo(UIScreen.main.bounds.size.height / (3.0 * 4.0))
        }
    }
    
}
