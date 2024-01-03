//
//  ViewController.swift
//  Bakkwojwo
//
//  Created by 여성일 on 2024/01/01.
//

import UIKit
import SnapKit

class ExchangeRateViewController: BaseViewController{
    
    private let mainTitleLabel: BaseTitleLabel = {
        let label = BaseTitleLabel(titleText: "국가별 환율", titleColor: .black, titleBackgroundColor: .white)
        label.font = .mainTitle
        return label
    }()
    
    private let subTitleLabel: BaseTitleLabel = {
        let label = BaseTitleLabel(titleText: "2024년 01월 03일 18:19:08 기준", titleColor: .darkGray, titleBackgroundColor: .white)
        label.font = .subTitle
        return label
    }()
    
    override func setView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.mainTitleLabel)
        self.view.addSubview(self.subTitleLabel)
    }
    
    override func setAutoLayout() {
        self.mainTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-200)
        }
        
        self.subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.mainTitleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-100)
        }
    }
}

