//
//  BaseCurrencyView.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/8/24.
//

import UIKit
import SnapKit

class BaseCurrencyView: BaseView {

    let BaseCurrencyTitleLable: BaseLabel = {
        let label = BaseLabel(text: "기준 통화", textColor: .black, backgroundColor: .clear, font: .h2!)
        return label
    }()
    
    let BaseCurrencyFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KRW")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let BaseCurrencyCountryLabel: BaseLabel = {
        let label = BaseLabel(text: "대한민국 원(₩)", textColor: .black , backgroundColor: .white, font: .h3!)
        return label
    }()
    
    let BaseCurrencyCodeNameLabel: BaseLabel = {
        let label = BaseLabel(text: "KRW", textColor: .gray , backgroundColor: .white, font: .h4!)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setView() {
        [self.BaseCurrencyFlagImageView, self.BaseCurrencyTitleLable, self.BaseCurrencyCountryLabel, self.BaseCurrencyCodeNameLabel].forEach { self.addSubview($0) }
    }
    
    override func setAutoLayout() {
        self.BaseCurrencyTitleLable.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-15)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-100)
        }
        
        self.BaseCurrencyFlagImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(15)
            $0.width.equalTo(25)
        }
        
        self.BaseCurrencyCountryLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-10)
            $0.leading.equalTo(self.BaseCurrencyFlagImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview()
        } 
        
        self.BaseCurrencyCodeNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(10)
            $0.leading.equalTo(self.BaseCurrencyFlagImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-150)
        }
    }
    
    func setData(_ data: [ExchangeRateModel]) {
        self.BaseCurrencyFlagImageView.image = UIImage(named: data[0].currencyCode)
        self.BaseCurrencyCountryLabel.text = "\(data[0].country) \(data[0].currencyName)"
        self.BaseCurrencyCodeNameLabel.text = data[0].currencyCode
    }
}
