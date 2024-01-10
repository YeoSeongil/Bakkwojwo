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
    
    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let countryLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .black , backgroundColor: .white, font: .h3!)
        return label
    }()   
    
    let currencyCodeNameLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .gray , backgroundColor: .white, font: .h4!)
        return label
    }()    
    
    let basePriceLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .black , backgroundColor: .white, font: .h4!)
        return label
    }()
    
    let changePriceLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .black , backgroundColor: .white, font: .h4!)
        return label
    }()
    
    let signedChangeRatePriceLabel: BaseLabel = {
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
        [self.flagImageView, self.countryLabel, self.currencyCodeNameLabel, self.basePriceLabel, self.changePriceLabel, self.signedChangeRatePriceLabel].forEach {
            self.contentView.addSubview($0)
        }
    }
    
    private func setAutoLayout() {
        self.flagImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(15)
            $0.width.equalTo(25)
        }
        
        self.countryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(self.flagImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-150)
        }
        
        self.currencyCodeNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.countryLabel.snp.bottom).offset(5)
            $0.leading.equalTo(self.flagImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-150)
        }
        
        self.basePriceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.countryLabel.snp.trailing).offset(15)
        }
        
        self.changePriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }                
        
        self.signedChangeRatePriceLabel.snp.makeConstraints {
            $0.top.equalTo(self.changePriceLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }

    }
    
    func setData(_ data: ExchangeRateModel) {
        self.flagImageView.image = UIImage(named: data.currencyCode)
        self.countryLabel.text = "\(data.country) \(data.currencyName)"
        self.currencyCodeNameLabel.text = data.currencyCode
        self.basePriceLabel.text = "\(data.basePrice)"
        self.changePriceLabel.text = "\(data.changePrice)"
        
        let roundSignedChangeRate = round(data.signedChangeRate * 100 * 100) / 100
        self.signedChangeRatePriceLabel.text = "(\(roundSignedChangeRate))"
        self.signedChangeRatePriceLabel.textColor = roundSignedChangeRate > 0 ? .blue : .red
        
    }
}
