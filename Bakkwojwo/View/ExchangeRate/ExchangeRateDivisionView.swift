//
//  ExchangeRateDivisionView.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/10/24.
//

import UIKit
import SnapKit

class ExchangeRateDivisionView: UIView {
    let DivisionCurrencyLable: BaseLabel = {
        let label = BaseLabel(text: "통화명", textColor: .black, backgroundColor: .clear, font: .h4!)
        label.textAlignment = .center
        return label
    }()
    
    let DivisionBasePriceLabel: BaseLabel = {
        let label = BaseLabel(text: "매매기준가", textColor: .black , backgroundColor: .white, font: .h4!)
        label.textAlignment = .center
        return label
    }()
    
    let DivisionChangePriceLabel: BaseLabel = {
        let label = BaseLabel(text: "환율변동", textColor: .black , backgroundColor: .white, font: .h4!)
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setView() {
        [self.DivisionCurrencyLable, self.DivisionBasePriceLabel, self.DivisionChangePriceLabel].forEach { self.addSubview($0) }
    }
    
    func setAutoLayout() {
        self.DivisionCurrencyLable.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-144)
        }
        
        self.DivisionBasePriceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.DivisionCurrencyLable.snp.trailing)
            $0.trailing.equalToSuperview().offset(-72)
        }
        
        self.DivisionChangePriceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.DivisionBasePriceLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }
    }
}
