//
//  BaseCurrencyView.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/8/24.
//

import UIKit
import SnapKit

protocol BaseCurrencyViewDelegate: AnyObject {
    func BaseCurrencySetKRWTapped()
    func BaseCurrencySetUSDTapped()
}

class BaseCurrencyView: UIView {
    weak var delegate: BaseCurrencyViewDelegate?
    let viewModel = ExchangeRateViewModel()
    
    var baseCurrencyState:Bool = false
    
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
    
    let BaseCurrencyChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(testButton), for: .touchUpInside)
        return button
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
        self.addSubview(self.BaseCurrencyFlagImageView)
        self.addSubview(self.BaseCurrencyTitleLable)
        self.addSubview(self.BaseCurrencyCountryLabel)
        self.addSubview(self.BaseCurrencyCodeNameLabel)
        self.addSubview(self.BaseCurrencyChangeButton)
    }
    
    func setAutoLayout() {
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
            $0.trailing.equalToSuperview().offset(-150)
        } 
        
        self.BaseCurrencyCodeNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(10)
            $0.leading.equalTo(self.BaseCurrencyFlagImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-150)
        }
        
        self.BaseCurrencyChangeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func setData(_ data: [ExchangeRateModel]) {
        self.BaseCurrencyFlagImageView.image = UIImage(named: data[0].currencyCode)
        self.BaseCurrencyCountryLabel.text = "\(data[0].country) \(data[0].currencyName)"
        self.BaseCurrencyCodeNameLabel.text = data[0].currencyCode
    }
    
    @objc func testButton(_ sender: UIButton) {
        // 다른 로직으로 수정
        if self.baseCurrencyState == false {
            self.baseCurrencyState = true
        } else {
            self.baseCurrencyState = false
        }
        
        self.baseCurrencyState == false ? self.delegate?.BaseCurrencySetKRWTapped() : self.delegate?.BaseCurrencySetUSDTapped()
    }
}
