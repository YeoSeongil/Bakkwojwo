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
    let viewModel = CalculatorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CalculatorKey.delegate = self
        self.viewModel.onUpdated = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.CalculatorResult.inputOperatorView.text = self.viewModel.currentInputViewText
            }
        }
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
    func tappedKey(_ k: String)  {
        self.viewModel.calculate(k)
    }
}
