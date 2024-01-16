//
//  ExchangeRateSectionCollectionViewCell.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/5/24.
//

import UIKit
import SnapKit

protocol ExchangeRateSectionCollectionViewDelegate {
    func checkBoxButtonTapped(_ cell: ExchangeRateSectionCollectionViewCell, _ button: CheckBox)
}

class ExchangeRateSectionCollectionViewCell: UICollectionViewCell {
    
    var delegate: ExchangeRateSectionCollectionViewDelegate?
    
    static let registerId: String = "ExchangeRateSectionCollectionViewCell"
    
    let checkBox: CheckBox = {
        let button = CheckBox()
        return button
    }()
    
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
        label.textAlignment = .center
        return label
    }()
    
    let changePriceLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .black , backgroundColor: .white, font: .h4!)
        label.textAlignment = .center
        return label
    }()
    
    let signedChangeRatePriceLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .black , backgroundColor: .white, font: .h4!)
        label.textAlignment = .center
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
        self.setAutoLayout()
        self.checkBox.tapped = { [weak self] in
            guard let self = self else {return}
            self.delegate?.checkBoxButtonTapped(self, self.checkBox)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        [self.checkBox,self.flagImageView, self.countryLabel, self.currencyCodeNameLabel, self.basePriceLabel, self.changePriceLabel, self.signedChangeRatePriceLabel].forEach {
            self.contentView.addSubview($0)
        }
    }
    
    private func setAutoLayout() {
        self.checkBox.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(25)
            $0.width.equalTo(25)
        }
        
        self.flagImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(15)
            $0.width.equalTo(25)
        }
        
        self.countryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(self.flagImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-144)
        }
        
        self.currencyCodeNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.countryLabel.snp.bottom).offset(5)
            $0.leading.equalTo(self.flagImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-144)
        }
        
        self.basePriceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.countryLabel.snp.trailing)
            $0.trailing.equalToSuperview().offset(-72)
        }
        
        self.changePriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(self.basePriceLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }
        
        self.signedChangeRatePriceLabel.snp.makeConstraints {
            $0.top.equalTo(self.changePriceLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.basePriceLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }

    }
    
    func setData(_ data: ExchangeRateModel) {
        self.flagImageView.image = UIImage(named: data.currencyCode)
        self.countryLabel.text = "\(data.country) \(data.currencyName)"
        self.currencyCodeNameLabel.text = data.currencyCode
        self.basePriceLabel.text = "\(data.basePrice)"
        self.changePriceLabel.text = "\(data.changePrice)"
        
        let roundSignedChangeRate = round(data.signedChangeRate * 100 * 100) / 100
        self.signedChangeRatePriceLabel.text = "(\(roundSignedChangeRate)%)"
        self.signedChangeRatePriceLabel.textColor = roundSignedChangeRate > 0 ? .blue : .red
    }
    
    func isHiddenAnimation(state: Bool) {
        if state == false {
            UIView.animate(withDuration: 0.35, animations: {
                self.flagImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.countryLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                self.currencyCodeNameLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        } else {
            UIView.animate(withDuration: 0.35, animations: {
                self.flagImageView.transform = CGAffineTransform(translationX: 35, y: 0)
                self.countryLabel.transform = CGAffineTransform(translationX: 35, y: 0)
                self.currencyCodeNameLabel.transform = CGAffineTransform(translationX: 35, y: 0)
                self.checkBox.alpha = 1.0
            })
        }
    }
}
