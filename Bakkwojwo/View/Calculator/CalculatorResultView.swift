//
//  CalculatorResultView.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/16/24.
//

import Foundation
import UIKit
import SnapKit

class CalculatorResultView: BaseView {
    
    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KRW")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let inputOperatorTextField: UITextField = {
        let textField = UITextField()
        textField.font = .h5
        textField.textAlignment = .right
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    let inputOperatorView: UILabel = {
        let label = UILabel()
        label.font = .h5
        label.textAlignment = .right
        label.textColor = .black
        label.text = "0"
        return label
    }()   
    
    let resultView: UILabel = {
        let label = UILabel()
        label.font = .h6
        label.textAlignment = .right
        label.textColor = .lightGray
        label.text = ""
        return label
    }()
    
    override func setView() {
        [self.flagImageView, self.inputOperatorView, self.resultView].forEach { self.addSubview($0) }
        self.backgroundColor =  .MidLights
    }
    
    override func setAutoLayout() {
        self.flagImageView.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.height.equalTo(20)
            $0.leading.equalToSuperview().offset(35)
            $0.centerY.equalToSuperview()
        }
        
        self.inputOperatorView.snp.makeConstraints {
            $0.top.equalTo(self.resultView.snp.bottom).offset(5)
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(self.flagImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-35)
        }
        
        self.resultView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-50)
            $0.leading.equalTo(self.flagImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-35)
        }
    }
}

