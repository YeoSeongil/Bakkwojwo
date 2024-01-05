//
//  ExchangeRateSectionCollectionViewCell.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/5/24.
//

import UIKit
import SnapKit

class ExchangeRateSectionCollectionViewCell: UICollectionViewCell {
    static let registerId: String = "ExchangeRateSectionCollectionViewCell"
    
    var countryLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .black , backgroundColor: .white, font: .h3!)
        return label
    }()   
    
    var currencyCodeNameLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .gray , backgroundColor: .white, font: .h4!)
        return label
    }()    
    
    var basePriceLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .black , backgroundColor: .white, font: .h4!)
        return label
    }()
    
    var changePriceLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .black , backgroundColor: .white, font: .h4!)
        return label
    }()
    
    var signedChangeRatePriceLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .black , backgroundColor: .white, font: .h4!)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        self.backgroundColor = .clear
        self.contentView.addSubview(self.countryLabel)
        self.contentView.addSubview(self.currencyCodeNameLabel)
        self.contentView.addSubview(self.basePriceLabel)
        self.contentView.addSubview(self.changePriceLabel)
        self.contentView.addSubview(self.signedChangeRatePriceLabel)
    }
    
    private func setAutoLayout() {
        self.countryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-250)
        }
        
        self.currencyCodeNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.countryLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-300)
        }
        
        self.basePriceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.countryLabel.snp.trailing).offset(100)
            $0.trailing.equalToSuperview().offset(-100)
        }
        
        self.changePriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(self.basePriceLabel.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-10)
        }                
        
        self.signedChangeRatePriceLabel.snp.makeConstraints {
            $0.top.equalTo(self.changePriceLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.basePriceLabel.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-10)
        }

    }
    
    func setData(_ data: ExchangeRateModel) {
        self.countryLabel.text = "\(data.country) \(data.currencyName)"
        self.currencyCodeNameLabel.text = data.currencyCode
        self.basePriceLabel.text = "\(data.basePrice)"
        self.changePriceLabel.text = "\(data.changePrice)"
        
        let roundSignedChangeRate = round(data.signedChangeRate * 100 * 100) / 100
        self.signedChangeRatePriceLabel.text = "(\(roundSignedChangeRate))"
        self.signedChangeRatePriceLabel.textColor = roundSignedChangeRate > 0 ? .blue : .red
        
    }
}
