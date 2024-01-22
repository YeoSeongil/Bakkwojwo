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
    let separatorBar = Custom_Separator()
    
    private let mainSectionTitleLabel: BaseLabel = {
        let label = BaseLabel(text: "환율 계산기", textColor: .black, backgroundColor: .white, font: .mainTitle2!)
        return label
    }()
    
    private let mainSectionSubTitleLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .darkGray, backgroundColor: .white, font: .subTitle!)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CalculatorKey.delegate = self
    }
    
    override func setView() {
        self.view.backgroundColor = .white
        [self.mainSectionTitleLabel, self.mainSectionSubTitleLabel, self.CalculatorKey, self.CalculatorResult, self.separatorBar].forEach { self.view.addSubview($0)}
    }
    
    override func setAutoLayout() {
        self.mainSectionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        self.mainSectionSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.mainSectionTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        self.CalculatorResult.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 13.0)
            $0.bottom.equalTo(self.CalculatorKey.snp.top)
        }
        
        self.separatorBar.snp.makeConstraints {
            $0.top.equalTo(self.CalculatorResult.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        self.CalculatorKey.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3.0)
        }
    }
    
    override func bind() {
        self.viewModel.onInputViewUpdated = { [weak self] in
            guard let self = self else { return }
            self.CalculatorResult.inputKeyValueView.text = self.viewModel.currentInputViewString
        }
        
        self.viewModel.onResultViewUpdated =  { [weak self] in
            guard let self = self else { return }
            self.CalculatorResult.calculateResultView.text = self.viewModel.currentResultString
        }
    }
}

extension CalculatorViewController: CalculatorViewDelegate {
    func tappedKey(_ k: String)  {
        self.viewModel.numberKeyTapped(k)
    }
    
    func tappedOper(_ k: String) {
        self.viewModel.operatorKeyTapped(k)
    }
}
