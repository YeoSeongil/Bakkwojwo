//
//  BaseUI_UILabel.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/3/24.
//

import Foundation
import UIKit

class BaseLabel: UILabel {
    /// ViewController의 기본이 되는 Label을 생성합니다.
    /// ```
    /// let titleLabel = BaseLabel(text: "Home", textColor: .black, backgroundColor: .white, font: h1)
    /// ```
    /// - Parameters:
    ///     - titleText: 라벨의 텍스트
    ///     - titleColor: 라벨의 텍스트 색상
    ///     - titleBackgroundColor: 라벨의 배경 색상
    init(text: String, textColor:UIColor, backgroundColor: UIColor, font: UIFont) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
